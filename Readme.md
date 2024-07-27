## Overall

### Summary of Detailed Technical Steps for DevSecOps Pipeline using AWS EC2

**Goal:** Build a DevSecOps pipeline for the spring-petclinic project using Docker, Jenkins, SonarQube, Prometheus, Grafana, OWASP ZAP, and Ansible for deploying the application to an AWS EC2 instance.

#### Step 1: Set Up Docker Containers

1. **Fork and Clone Repository**

   - Fork the [spring-petclinic](https://github.com/spring-projects/spring-petclinic) repository on GitHub/GitLab.
   - Clone the forked repository to your local machine.
2. **Create a Custom Docker Network**

   - Create a Docker network to connect all the services:
     ```bash
     docker network create dev-network
     ```
3. **Set Up Jenkins**

   - Create a docker-compose file:
   - Create a `Dockerfile` for Jenkins and build the image:

   ```Dockerfile
   FROM jenkins/jenkins:lts

   USER root
   RUN apt-get update \
         && apt-get install -y sudo \
         && apt-get install -y maven \
         && rm -rf /var/lib/apt/lists/*

   # Optionally set up Maven environment variables
   ENV MAVEN_HOME /usr/share/maven
   ENV PATH $MAVEN_HOME/bin:$PATH

   RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
   RUN sudo apt-get update \
         && sudo apt-get install ca-certificates curl unzip \
         && sudo install -m 0755 -d /etc/apt/keyrings \
         && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
         && sudo chmod a+r /etc/apt/keyrings/docker.asc

   RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   RUN sudo apt-get update

   RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

   RUN sudo apt-get install iproute2 -y
   RUN sudo apt-get install ansible -y
   RUN sudo apt-get install openssh-server -y

   RUN apt-get update && apt-get install -y curl gnupg apt-transport-https

   # Install AWS CLI
   RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" && \
       unzip awscliv2.zip && \
       sudo ./aws/install

   # Copy the SSH key to a specific location in the Docker image
   COPY key/petclinic_key_pair.pem /root/.ssh/petclinic_key_pair.pem
   COPY key/petclinic_key_pair.pem.pub /root/.ssh/petclinic_key_pair.pem.pub
   RUN chmod 600 /root/.ssh/petclinic_key_pair.pem

   USER jenkins

   RUN jenkins-plugin-cli --plugins \
       trilead-api:2.147.vb_73cc728a_32e \
       docker-workflow \
       workflow-aggregator \
       sonar \
       prometheus \
       zap \
       git \
       pipeline-stage-step \
       ansible \
       cloudbees-disk-usage-simple \
       aws-credentials \
       credentials-binding \
       pipeline-aws

   COPY ansible /opt/ansible

   ENTRYPOINT ["/bin/sh", "-c" , "sudo service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh "] # Override the default entrypoint

   ```


   Create and run the SonarQube container:

   ```bash
   docker run -d --name sonarqube --network dev-network -p 9000:9000 sonarqube
   ```


   5. **Set Up Prometheus**

      - Create a `prometheus.yml` configuration file for Prometheus:
        ```yaml
        global:
          scrape_interval: 15s
        scrape_configs:
          - job_name: 'jenkins'
            static_configs:
              - targets: ['jenkins:8080']
        ```
      - Create and run the Prometheus container:
        ```bash
        docker run -d --name prometheus --network dev-network -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
        ```
   6. **Set Up Grafana**

      - Create a `grafana.ini` configuration file for Grafana:
        ```ini
        [server]
        protocol = http
        http_port = 3000
        domain = 192.168.1.5
        root_url = %(protocol)s://%(domain)s:%(http_port)s/
        serve_from_sub_path = false
        [security]
        admin_user = admin
        admin_password = admin
        ```
      - Create and run the Grafana container:
        ```bash
        docker run -d --name grafana --network dev-network -p 3000:3000 -v $(pwd)/grafana.ini:/etc/grafana/grafana.ini grafana/grafana
        ```


   ```

   ```
4. **Set Up SonarQube**

```

7. **Set Up OWASP ZAP**
   - Create and run the OWASP ZAP container:
     ```bash
     docker run -d --name owasp-zap --network dev-network -p 8081:8081 zaproxy/zap2docker-stable zap.sh -daemon -host 0.0.0.0 -port 8081
```

#### Step 2: Configure Jenkins Pipeline

1. **Create Jenkins Pipeline**
   - Create a `Jenkinsfile` in the root of the forked repository:
     ```groovy
     pipeline {
         agent any

         environment {
             DOCKER_NETWORK = 'dev-network'
             DOCKER_IMAGE = 'akashcha/spring-petclinic'
             ZAP_CONTAINER_NAME = 'owasp-zap'
             ZAP_URL = 'http://192.168.1.6:8081'
             SONARQUBE_URL = 'http://192.168.1.3:9000'
             SONARQUBE_LOGIN = 'your-sonarqube-token'
             DEPLOYMENT_URL = 'http://192.168.1.2:8082'
             SSH_USER = 'ec2-user'
             TARGET_HOST = 'ec2-public-dns' // Replace with your EC2 instance's public DNS
         }

         stages {
             stage('Setup Docker Network') {
                 steps {
                     echo 'Setting up Docker network...'
                     sh 'docker network create ${DOCKER_NETWORK} || true'
                 }
             }

             stage('Checkout') {
                 steps {
                     echo 'Checking out the repository...'
                     git branch: 'main', url: 'https://github.com/yourusername/spring-petclinic.git'
                     echo 'Repository checked out successfully.'
                 }
             }

             stage('Build') {
                 steps {
                     script {
                         sh 'mvn clean package'
                     }
                 }
             }

             stage('Run Test Instance') {
                 steps {
                     script {
                         sh 'nohup mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &'
                         sleep 5
                     }
                 }
             }

             stage('Static Analysis') {
                 steps {
                     script {
                         sh 'mvn clean verify'
                         sh """
                             docker run --rm --network ${env.DOCKER_NETWORK} \
                                 -v \$(pwd):/usr/src -w /usr/src \
                                 sonarsource/sonar-scanner-cli \
                                 sonar-scanner -Dsonar.projectKey=spring-petclinic \
                                 -Dsonar.sources=. -Dsonar.java.binaries=target/classes \
                                 -Dsonar.host.url=${env.SONARQUBE_URL} -Dsonar.login=${env.SONARQUBE_LOGIN}
                         """
                     }
                 }
             }

             stage('Prepare ZAP Analysis') {
                 steps {
                     script {
                         try {
                             sh 'docker exec owasp-zap mkdir -p /zap/wrk'
                         } catch (Exception e) {
                             echo "Error during preparing ZAP Analysis Script: ${e}"
                         }
                     }
                 }
             }

             stage('Security Analysis') {
                 steps {
                     script {
                         try {
                             sh 'docker exec owasp-zap zap-baseline.py -t ${env.DEPLOYMENT_URL} -r /zap/wrk/zap-report.html --autooff'
                         } catch (Exception e) {
                             echo "Error during security analysis: ${e}"
                         }
                     }
                 }
             }

             stage('Copy ZAP Report') {
                 steps {
                     script {
                         try {
                             sh 'docker cp owasp-zap:/zap/wrk/zap-report.html ${WORKSPACE}/zap-report.html'
                             archiveArtifacts artifacts: 'zap-report.html', allowEmptyArchive: true
                         } catch (Exception e) {
                             echo "Error during copying ZAP report: ${e}"
                         }
                     }
                 }
             }

             stage('Deploy with Ansible') {
                 steps {
                     script {
                         try {
                             sh """
                                 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/your-ec2-key.pem ${SSH_USER}@${TARGET_HOST} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/your-ec2-key.pub
                             """
                             sh """
                                 ansible-playbook -i /opt/ansible/inventory.ini /opt/ansible/playbook.yml --private-key ~/.ssh/your-ec2-key.pem
                             """
                             script {
                                 env.DEPLOYMENT_URL = 'http://ec2-public-dns:8082' // Replace with your EC2 instance's public DNS
                                 echo "Application deployed at ${env.DEPLOYMENT_URL}"
                             }
                         } catch (Exception e) {
                             echo "Error during deployment with Ansible: ${e}"
                         }
                     }
                 }
             }
         }

         post {
             always {
                 echo 'Pipeline execution completed.'
             }
             success {
                 echo 'Pipeline completed successfully.'
             }
             failure {
                 echo 'Pipeline failed.'
             }
         }
     }
     ```

   ```

   ```

#### Step 3: Configure SonarQube

1. **SonarQube Configuration**
   - Log in to the SonarQube instance.
   - Create a new project and generate a token.
   - Use the generated token in the Jenkins pipeline for authentication.

#### Step 4: Configure Prometheus and Grafana

1. **Prometheus Configuration**
   - Update the `prometheus.yml` file to scrape metrics from Jenkins:

```yaml
     global:
       scrape_interval: 15s
     scrape_configs:
       - job_name: 'jenkins'
         static_configs:
           - targets: ['jenkins:8080']
```

2. **Grafana Configuration**
   - Log in to Grafana and add Prometheus as a data source.
   - Create dashboards to visualize Jenkins metrics.

#### Step 5: Set Up AWS EC2 Instance

#### Step 6:  Launch EC2 Instance

Here's a detailed guide to launching an EC2 instance using the AWS Management Console:

##### Step 1: Log in to the AWS Management Console

1. Open a web browser and navigate to the [AWS Management Console](https://aws.amazon.com/console/).
2. Sign in with your AWS account credentials.

##### Step 2: Navigate to the EC2 Dashboard

1. From the AWS Management Console, click on **Services** in the top-left corner.
2. Under the **Compute** category, select **EC2**.

##### Step 3: Launch an Instance

1. On the EC2 Dashboard, click the **Launch Instance** button.

##### Step 4: Choose an Amazon Machine Image (AMI)

1. Select an AMI based on your requirements. For this guide, we'll use **Ubuntu Server 20.04 LTS**.
   - You can find this AMI by searching for "Ubuntu Server 20.04 LTS" in the **Quick Start** tab.
2. Click the **Select** button next to your chosen AMI.

##### Step 5: Choose an Instance Type

1. Select an instance type based on your needs. For most purposes, the **t2.micro** instance type is sufficient and falls under the Free Tier eligibility.
2. Click the **Next: Configure Instance Details** button.

##### Step 6: Configure Instance Details

1. **Number of instances:** Keep it as 1.
2. **Network:** Select the VPC you want to launch your instance in. If you don't have a VPC, the default VPC will be selected.
3. **Subnet:** Choose a subnet within your VPC. Ensure that the subnet has auto-assign public IP enabled, or select **Enable** under the **Auto-assign Public IP** dropdown.
4. **Auto-assign Public IP:** Ensure that this is set to **Enable** if it is not already enabled.
5. **IAM role:** If you have an IAM role you want to attach to this instance, select it here. Otherwise, you can leave it as **None**.
6. Leave all other settings as default unless you have specific requirements.
7. Click the **Next: Add Storage** button.

##### Step 7: Add Storage

1. The default storage configuration should suffice, but you can adjust the storage size and type if necessary.
   - For example, you might want to increase the storage size from the default 8 GB to 20 GB.
2. Click the **Next: Add Tags** button.

##### Step 8: Add Tags

1. (Optional) Add tags to help identify your instance. Tags are key-value pairs.
   - For example, you could add a tag with **Key:** `Name` and **Value:** `MyFirstEC2Instance`.
2. Click the **Next: Configure Security Group** button.

##### Step 9: Configure Security Group

1. **Security group name:** Provide a name for your security group, such as `MyEC2SecurityGroup`.
2. **Description:** Provide a description, such as `Security group for my EC2 instance`.
3. **Inbound rules:**
   - Add a rule to allow SSH traffic:
     - **Type:** SSH
     - **Protocol:** TCP
     - **Port Range:** 22
     - **Source:** `My IP` (this will auto-fill your current IP address) or `Anywhere` if you want to allow SSH from any IP address.
   - Add a rule to allow HTTP traffic for your application:
     - **Type:** Custom TCP
     - **Protocol:** TCP
     - **Port Range:** 8082
     - **Source:** `Anywhere`
4. Click the **Review and Launch** button.

##### Step 10: Review and Launch

1. Review your instance configuration.
2. Click the **Launch** button.

##### Step 11: Select an Existing Key Pair or Create a New Key Pair

1. In the **Select an existing key pair or create a new key pair** dialog box, choose **Create a new key pair**.
2. Provide a name for the key pair, such as `my-ec2-key`.
3. Click the **Download Key Pair** button to download the `.pem` file (e.g., `my-ec2-key.pem`). **Note:** Keep this file secure as it is required to SSH into your instance.
4. Click the **Launch Instances** button.

##### Step 12: View Your Instances

1. Click the **View Instances** button to return to the EC2 Dashboard.
2. Your new instance will be listed. Initially, the instance state will be **Pending**. Wait for the instance state to change to **Running**.

##### Step 13: SSH into Your EC2 Instance

1. Open a terminal on your local machine.
2. Navigate to the directory where your key pair file (`my-ec2-key.pem`) is stored.
3. Change the permissions of the key pair file to ensure it's not publicly viewable:
   ```sh
   chmod 400 my-ec2-key.pem
   ```
4. Connect to your EC2 instance using SSH:
   ```sh
   ssh -i "my-ec2-key.pem" ubuntu@your-ec2-public-ip
   ```

   - Replace `your-ec2-public-ip` with the Public IP address of your EC2 instance.

By following these steps, you will have successfully launched an EC2 instance, configured it with necessary security groups, and connected to it via SSH.Step 6: Configure Ansible for Deployment

1. **Create Ansible Inventory File**
   - Create an `inventory.ini` file for Ansible:
     ```ini
     [web]
     ec2-public-dns ansible_user=ec2-user
     ```

```

2. **Create Ansible Playbook**
   - Create an `ansible/playbook.yml` file:
     ```yaml
     ---
     - hosts: all
       become: yes
       tasks:
         - name: Install Java
           apt:
             name: openjdk-8-jdk
             state: present

         - name: Deploy Spring Petclinic
           copy:
             src: /path/to/your/spring-petclinic.jar
             dest: /opt/spring-petclinic.jar

         - name: Create systemd service file
           template:
             src: petclinic.service.j2
             dest: /etc/systemd/system/petclinic.service

         - name: Start Spring Petclinic service
           systemd:
             name: petclinic
             state: started
             enabled: yes
     ```

3. **Create Systemd Service Template**
   - Create the `petclinic.service.j2` template:
     ```ini
     [Unit]
     Description=Spring Petclinic
     After=syslog.target

     [Service]
     User=ec2-user
     ExecStart=/usr/bin/java -jar /opt/spring-petclinic.jar
     SuccessExitStatus=143

     [Install]
     WantedBy=multi-user.target
```

#### Step 7: Run Ansible Playbook

1. **Execute the Playbook from Jenkins**
   - Add the following stage to the `Jenkinsfile` to run the Ansible playbook:
     ```groovy
     stage('Deploy with Ansible') {
         steps {
             script {
                 try {
                     sh """
                         ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/your-ec2-key.pem ${SSH_USER}@${TARGET_HOST} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/your-ec2-key.pub
                     """
                     sh """
                         ansible-playbook -i /opt/ansible/inventory.ini /opt/ansible/playbook.yml --private-key ~/.ssh/your-ec2-key.pem
                     """
                     script {
                         env.DEPLOYMENT_URL = 'http://ec2-public-dns:8082'
                         echo "Application deployed at ${env.DEPLOYMENT_URL}"
                     }
                 } catch (Exception e) {
                     echo "Error during deployment with Ansible: ${e}"
                 }
             }
         }
     }
     ```

```

#### Step 8: Verify the Setup

1. **Verify Application Deployment**
   - Ensure the spring-petclinic application is running on the EC2 instance and accessible at `http://ec2-public-dns:8082`.

2. **Test Automated Build and Deployment**
   - Make and push a code change to the GitHub repository.
   - Verify Jenkins automatically builds, tests, and deploys the new version, and the content change is reflected in the deployed application.

#### Deliverables

1. **Step-by-Step Instructions**
   - Provide detailed documentation outlining the steps to set up the environment and configure the DevSecOps pipeline.

2. **Provisioning Scripts and Configuration Files**
   - Submit Dockerfiles, Jenkinsfile, Ansible playbooks, configuration files, etc.

3. **Screenshots**
   - Include screenshots of:
     - Spring-petclinic welcome screen on the production web server.
     - Key Jenkins, SonarQube, Prometheus, Grafana, and OWASP ZAP screens.
     - Evidence showing that a code change triggers the pipeline and deployment.

4. **Pipeline Demonstration**
   - Provide a short video demonstrating the automated build, deployment, and monitoring process.

By following these detailed steps, you can successfully set up and configure a DevSecOps pipeline for the spring-petclinic project, incorporating security, continuous integration, continuous delivery, and monitoring using AWS EC2 for deployment.
```
