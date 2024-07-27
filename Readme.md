1. -

# ==Tooling==:

## Host OS: macOS

1. OS Host Details:
   1. OS Name: macOS Sonoma Version 14.5
   2. Build version: 23F79
   3. Chipset: Apple M1 Pro
2. Screenshot :
   ![[./screenshots/macversion 1.png]]
3. Source: Using commands hostname and sw_vers
   ==sreeakash@KP-QNPHXDYRW1 ~ %== hostname
   KP-QNPHXDYRW1
   ==sreeakash@KP-QNPHXDYRW1 ~ %== sw_vers
   ProductName: macOS
   ProductVersion: 14.5
   BuildVersion: 23F79

Reference: https://commandmasters.com/commands/sw_vers-osx/

## Softwares used

1. Versions:

   1. **docker version**: Docker version 26.1.4, build 5650f9b
   2. **grep version**: grep (BSD grep, GNU compatible) 2.6.0-FreeBSD
   3. **coreutils version**: coreutils: stable 9.5 (bottled), HEAD
   4. s**h version**: GNU bash, version 3.2.57(1)-release (arm64-apple-darwin23)
   5. **zsh version**: zsh 5.9 (x86_64-apple-darwin23.0)
   6. **sw_vers version**: Thw sw_vers command does not have a specific version number separate from the macOS version itself.
   7. **ubuntu version**: Ubuntu 24.04 LTS
   8. **OpenSSH Client**: OpenSSH_9.6p1 Ubuntu-3ubuntu13.3, OpenSSL 3.0.13 30 Jan 2024
   9. **apt-get version** : apt 2.7.14 (arm64)
   10. **chown**: chown (GNU coreutils) 9.4
   11. **chmod**: chmod (GNU coreutils) 9.4
   12. **nano**:  GNU nano, version 7.2
   13. **mkdir**: mkdir (GNU coreutils) 9.4
2. Source:
   ==sreeakash@KP-QNPHXDYRW1 files % ==docker --version
   Docker version 26.1.4, build 5650f9b
   ==sreeakash@KP-QNPHXDYRW1 files % ==grep --version | head -n 1
   grep (BSD grep, GNU compatible) 2.6.0-FreeBSD
   ==sreeakash@KP-QNPHXDYRW1 files % ==brew info coreutils | grep "coreutils:"
   ==> coreutils: stable 9.5 (bottled), HEAD
   ==sreeakash@KP-QNPHXDYRW1 files % ==sh --version
   GNU bash, version 3.2.57(1)-release (arm64-apple-darwin23)
   Copyright (C) 2007 Free Software Foundation, Inc.
   ==sreeakash@KP-QNPHXDYRW1 files % ==zsh --version
   zsh 5.9 (x86_64-apple-darwin23.0)
   ==sreeakash@KP-QNPHXDYRW1 ~ %== docker exec server_container cat /etc/os-release
   PRETTY_NAME="Ubuntu 24.04 LTS"
   NAME="Ubuntu"
   VERSION_ID="24.04"
   VERSION="24.04 LTS (Noble Numbat)"
   VERSION_CODENAME=noble
   ID=ubuntu
   ID_LIKE=debian
   HOME_URL="https://www.ubuntu.com/"
   SUPPORT_URL="https://help.ubuntu.com/"
   BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
   PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
   UBUNTU_CODENAME=noble
   LOGO=ubuntu-logo
   ==sreeakash@KP-QNPHXDYRW1 ~ %== docker exec client_container cat /etc/os-release
   PRETTY_NAME="Ubuntu 24.04 LTS"
   NAME="Ubuntu"
   VERSION_ID="24.04"
   VERSION="24.04 LTS (Noble Numbat)"
   VERSION_CODENAME=noble
   ID=ubuntu
   ID_LIKE=debian
   HOME_URL="https://www.ubuntu.com/"
   SUPPORT_URL="https://help.ubuntu.com/"
   BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
   PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
   UBUNTU_CODENAME=noble
   LOGO=ubuntu-logo
   root@8bd802f8ae6b:/# "ssh" "-V" "OpenSSH Client"
   OpenSSH_9.6p1 Ubuntu-3ubuntu13.3, OpenSSL 3.0.13 30 Jan 2024
   root@8bd802f8ae6b:/# "apt-get" "--version" "APT-GET"
   apt 2.7.14 (arm64)
   root@8bd802f8ae6b:/# "chown" "--version" "CHOWN"
   chown (GNU coreutils) 9.4
   Copyright (C) 2023 Free Software Foundation, Inc.
   License GPLv3+: GNU GPL version 3 or later [https://gnu.org/licenses/gpl.html](https://gnu.org/licenses/gpl.html).
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.

   Written by David MacKenzie and Jim Meyering.
   root@8bd802f8ae6b:/# "chmod" "--version" "CHMOD"
   chmod (GNU coreutils) 9.4
   Copyright (C) 2023 Free Software Foundation, Inc.
   License GPLv3+: GNU GPL version 3 or later [https://gnu.org/licenses/gpl.html](https://gnu.org/licenses/gpl.html).
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.

   Written by David MacKenzie and Jim Meyering.
   OpenSSH_9.6p1 Ubuntu-3ubuntu13.3, OpenSSL 3.0.13 30 Jan 2024
   root@0dfc25f9c7e7:/# "nano" "--version" "Nano"
   GNU nano, version 7.2
   (C) 2023 the Free Software Foundation and various contributors
   Compiled options: --disable-libmagic --enable-utf8
   root@0dfc25f9c7e7:/# "mkdir" "--version" "MKDIR"
   mkdir (GNU coreutils) 9.4
   Copyright (C) 2023 Free Software Foundation, Inc.
   License GPLv3+: GNU GPL version 3 or later [https://gnu.org/licenses/gpl.html](https://gnu.org/licenses/gpl.html).
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.

   Written by David MacKenzie.
3. Screenshot:

   1. ![[./screenshots/Software_or_tools_version.png]]

# STEPS

**Goal:** Build a DevSecOps pipeline for the spring-petclinic project using Docker, Jenkins, SonarQube, Prometheus, Grafana, OWASP ZAP, and Ansible for deploying the application to an AWS EC2 instance.

To accomplish this assignment, follow these steps:

## Step 1: Installing Docker on Mac

1. **Install Docker on Your Host Machine (Mac)**:

   Referenced:  [link:](https://docs.docker.com/desktop/install/mac-install/#install-and-run-docker-desktop-on-mac)

   1. ==Downloaded the Docker file from [link](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64&_gl=1*1utz1qt*_ga*MTU0MDU1NDI0MS4xNzA4MDc0NTYw*_ga_XJWPQMJYHQ*MTcxOTE0MTk4OS4xMS4xLjE3MTkxNDE5ODkuNjAuMC4w)==
      ![[./screenshots/1_download_docker_file_for_apple_silicon_chip.png]]
   2. Download complete
      ![[./screenshots/2_download_complete.png]]
   3. Copy Docker.app to Applications folder
      ![./screenshots/3_Copy_Docker.app_to_Applications_folder.png]
   4. Copying to applications folder on my mac in progress
      ![[./screenshots/4_Copying_in_progress.png]]
   5. Open the copied docker file
      ![[./screenshots/5_Open_the_copied_Docker_app.png]]
   6. Accept Docker service agreement
      ![[./screenshots/6_Accept_the_terms_before_docker_starts.png]]
   7. Use recommended settings and Finish
      ![[./screenshots/7_Use_recommended_settings_and_finish.png]]
   8. Either create an account on docker or sign in using existing account.
      ![[./screenshots/8_Either create an account on docker or sign in using existing account.png]]
   9. Signing in using existing docker account.
      ![[./screenshots/9_Signing in using existing docker account.png]]
   10. Docker is installed and signed-in. Now proceed to the docker desktop app.
       ![[./screenshots/11_Docker is installed and signed-in_proceed.png]]
   11. Check if docker is installed by checking the docker version
       ![[./screenshots/12_Check if docker is installed by checking the docker version.png]]
   12. Run hello-world test just to make sure everything is working fine.
       ![[./screenshots/13_Run hello-world test just to make sure everything is work fine.png]]
   13. Check on the docker app if the hello-world container instance ran and exited as expected
       ![[./screenshots/14_Check on the docker app if the hello-world container instance ran and exited as expected.png]]

## Step 2: Set Up Docker Containers

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
4. **Set Up SonarQube**

   - Create and run the SonarQube container:

   ```bash
   docker run -d --name sonarqube --network dev-network -p 9000:9000 sonarqube
   ```
5. **Set Up OWASP ZAP**

   - Create and run the OWASP ZAP container:

   ```bash
   docker run -d --name owasp-zap --network dev-network -p 8081:8081 zaproxy/zap2docker-stable zap.sh -daemon -host 0.0.0.0 -port 8081
   ```
6. **Set Up Prometheus**

   - Create a `prometheus.yml` configuration file for Prometheus:

   ```yaml
   global:
     scrape_interval: 15s

   scrape_configs:
     - job_name: 'jenkins'
       metrics_path: /prometheus
       scheme: http
       static_configs:
         - targets: ['192.168.1.2:8080']

     - job_name: 'prometheus'
       static_configs:
         - targets: ['192.168.1.4:9090']
   ```

   - Create and run the Prometheus container:

   ```bash
   docker run -d --name prometheus --network dev-network -p 9090:9090 -v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
   ```
7. **Set Up Grafana**

   - Create a `grafana.ini` configuration file for Grafana:

   ```ini
   [server]
   # The protocol to use (http or https)
   protocol = http

   # The port to use for HTTP/HTTPS
   http_port = 3000

   # The domain to use for this instance
   domain = 192.168.1.5

   # The full URL to access Grafana
   root_url = %(protocol)s://%(domain)s:%(http_port)s/

   # If you want to serve Grafana from a subpath
   serve_from_sub_path = false

   [security]
   # Admin user credentials
   # These credentials can be overridden with environment variables for better security management
   admin_user = admin
   admin_password = admin

   # (Optional) Disable signup for new users
   disable_signup = true

   # (Optional) Set the default UI theme for all users
   default_theme = dark

   # (Optional) Enable/disable anonymous access
   ;allow_embedding = false
   ;allow_sign_up = false
   ;login_remember_days = 7
   ;cookie_username = grafana_user
   ;cookie_remember_name = grafana_remember
   ```

   - Create and run the Grafana container:

```bash
docker run -d --name grafana --network dev-network -p 3000:3000 -v $(pwd)/grafana.ini:/etc/grafana/grafana.ini grafana/grafana
```

## Step 3: Configure Jenkins Pipeline

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

## Step 4: Configure SonarQube

1. **SonarQube Configuration**
   - Log in to the SonarQube instance.
   - Create a new project and generate a token.
   - Use the generated token in the Jenkins pipeline for authentication.

## Step 5: Configure Prometheus and Grafana

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

   - Log in to Grafana and create dashboards to visualize Jenkins metrics.

## Step 6: Set Up AWS EC2 Instance

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

By following these steps, you will have successfully launched an EC2 instance, configured it with necessary security groups, and connected to it via SSH.

## Step 7: Configure Ansible for Deployment

1. **Create Ansible Inventory File**

   - Create an `inventory.ini` file for Ansible:

```ini
[new_ec2]
3.14.144.37 ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/key/petclinic_key_pair.pem
```

1. **Create Ansible Playbook**

   - Create an `ansible/deploy-petclinic.yml` file:

   ```yaml
   ---
   - name: Deploy Spring PetClinic Application
   hosts: new_ec2
   become: yes
   vars:
   jar_file: "/home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar"
   tasks:
   - name: Update the package list
   apt:
   update_cache: yes

   - name: Install OpenJDK 17
   apt:
   name: openjdk-17-jdk
   state: present

   - name: Copy the Spring PetClinic JAR file to the EC2 instance
   copy:
   src: "{{ jar_file }}"
   dest: /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar
   mode: '0755'
   owner: ubuntu
   group: ubuntu

   - name: Run the Spring PetClinic application
   shell: "nohup java -jar /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar > /home/ubuntu/petclinic.log 2>&1 &"
   args:
   chdir: /home/ubuntu
   register: run_result

   - name: Debug - Check if the application is running
   shell: "ps aux | grep spring-petclinic-3.3.0-SNAPSHOT.jar"
   register: ps_result

   - debug:
   msg: "Run Result: {{ run_result }}"

   - debug:
   msg: "Process Status: {{ ps_result }}"

   - name: Create and Configure EC2 Instance
   hosts: localhost
   tasks:
   - name: Create a new EC2 instance
   command: >
   aws ec2 run-instances
   --image-id {{ ami_id }}
   --count 1
   --instance-type {{ instance_type }}
   --key-name {{ key_name }}
   --security-group-ids {{ security_group_id }}
   --subnet-id {{ subnet_id }}
   --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-ec2-instance}]'
   --region {{ region }}
   --query 'Instances[0].InstanceId'
   --output text
   register: ec2_instance

   - name: Wait for the EC2 instance to be running
   command: >
   aws ec2 wait instance-running
   --instance-ids {{ ec2_instance.stdout }}
   --region {{ region }}

   - name: Get the public IP of the new EC2 instance
   command: >
   aws ec2 describe-instances
   --instance-ids {{ ec2_instance.stdout }}
   --region {{ region }}
   --query 'Reservations[0].Instances[0].PublicIpAddress'
   --output text
   register: ec2_ip

   - name: Update the Ansible inventory with the new EC2 instance
   lineinfile:
   path: ./inventory.ini
   regexp: '^new_ec2'
   line: "new_ec2 ansible_host={{ ec2_ip.stdout }} ansible_user=ubuntu ansible_ssh_private_key_file={{ ssh_key_path }}"
   delegate_to: localhost
   ```

## Step 8: Run Ansible Playbook

1. **Execute the Playbook from Jenkins**
   - Add the following stage to the `Jenkinsfile` to run the Ansible playbook:

```groovy
        stage('Deploy to EC2 using Ansible') {
            steps {
                withAWS(credentials: 'aws-credentials') {
                script {
                    try {
                            writeFile file: 'ansible.cfg', text: """
                                [defaults]
                                host_key_checking = False
                            """

                            def keyExists = sh(script: """
                                ssh -o StrictHostKeyChecking=no -o BatchMode=yes -o ConnectTimeout=5 -i ${LOCAL_SSH_KEY_PATH} ${SSH_USER}@${env.INSTANCE_IP} "echo 'Key exists'"
                            """, returnStatus: true) == 0

                            if (keyExists) {
                                echo "SSH key already exists in AWS."
                            } else {
                                echo "Deleting existing key from AWS if it exists."
                                sh """
                                    aws ec2 delete-key-pair --key-name ${KEY_NAME} --region ${AWS_REGION} || true
                                """

                                echo "Importing SSH key to AWS."
                                sh """
                                    aws ec2 import-key-pair --key-name ${KEY_NAME} --public-key-material fileb://${LOCAL_SSH_KEY_PATH}.pub --region ${AWS_REGION}
                                """
                            }

                            // Run the Ansible playbook with necessary variables
                    sh """
                        ansible-playbook -i inventory.ini ${WORKSPACE}/deploy-petclinic.yml \
                        -e ami_id=${AMI_ID} \
                        -e instance_type=${INSTANCE_TYPE} \
                        -e key_name=${KEY_NAME} \
                        -e security_group_id=${SECURITY_GROUP_ID} \
                        -e subnet_id=${SUBNET_ID} \
                        -e region=${AWS_REGION} \
                        -e jar_file=${WORKSPACE}/${JAR_FILE} \
                        -e ssh_key_path=${LOCAL_SSH_KEY_PATH}
                    """
                    } catch (Exception e) {
                        echo "Error deploying to EC2 using Ansible: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                    }
                }
            }
        }}
```

## Step 9: Verify the Setup

1. **Verify Application Deployment**

   - Ensure the spring-petclinic application is running on the EC2 instance and accessible at `http://ec2-public-dns:8082`.
2. **Test Automated Build and Deployment**

   - Make and push a code change to the GitHub repository.
   - Verify Jenkins automatically builds, tests, and deploys the new version, and the content change is reflected in the deployed application.

## Deliverables

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
