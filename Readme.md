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
   4. **sh version**: GNU bash, version 3.2.57(1)-release (arm64-apple-darwin23)
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

# Steps

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
     docker network create dev-network     ```3. **Set Up Jenkins**  

     ```
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
       blueocean \
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
           PROJECT_NAME = 'devops-finalproject-akash'
           DOCKER_NETWORK = "${PROJECT_NAME}_dev-network"
           ZAP_CONTAINER_NAME = 'owasp-zap'
           ZAP_URL = 'http://192.168.1.6:8081'
           SONARQUBE_URL = 'http://192.168.1.3:9000'
           SONARQUBE_LOGIN = 'squ_e1e70d0009e9f60a767cca521528ef557b1b0543' // Authentication token for SonarQube
           DEPLOYMENT_URL = 'http://192.168.1.2:8082' // Placeholder for the application URL
           SSH_USER = 'ubuntu'
           AWS_REGION = 'us-east-1'
           AMI_ID = 'ami-039a6f82dd07a541e'
           INSTANCE_TYPE = 't2.micro'
           KEY_NAME = 'petclinic_key_pair'
           SECURITY_GROUP_ID = 'sg-0fba393f98de9bcbe'
           SUBNET_ID ='subnet-0d2f18bee0a9a0ca1'
           LOCAL_SSH_KEY_PATH = '/root/.ssh/petclinic_key_pair.pem'  // Path to the SSH key inside the container
           JAR_FILE = '/target/spring-petclinic-3.3.0-SNAPSHOT.jar'
       }

       stages {
           stage('Cleanup') {
               steps {
                   script {
                       try {
                       sh 'rm -f ${WORKSPACE}/zap-report.html'
                       } catch (Exception e) {
                           echo "Error during cleanup: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                   }
               }
           }

           stage('Checkout') {
               steps {
                   echo 'Checking out the repository...'
                   git branch: 'main', url: 'https://github.com/akashcha/spring-petclinic.git'
                   echo 'Repository checked out successfully.'
               }
           }

           stage('Build') {
               steps {
                   script {
                       sh 'mvn clean package -Dmaven.test.skip=true'
                   }
               }
           }

            stage('Test') {
                steps {
                    script {
                       try {
                        sh """
                            mvn test
                        """
                       } catch (Exception e) {
                           echo "Error during testing: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                    }
                }
            }

          stage('Setup Docker Network') {
                   steps {
                   script {
                       try {
                   echo "Setting up Docker network: ${env.DOCKER_NETWORK}"
                       sh 'docker network create ${DOCKER_NETWORK} || true'
                       } catch (Exception e) {
                           echo "Error setting up Docker network: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                   }
              }
           }

           stage('Prepare SSH Key') {
               steps {
                   script {
                       sh 'chmod 600 ${LOCAL_SSH_KEY_PATH}'
                   }
               }
           }

           stage('Static Analysis') {
               steps {
                   echo 'Starting static analysis...'
                   script {
                       try {
                           sh 'mvn clean verify'
                                   sh """
                                       docker run --rm \
                               --platform linux/amd64 \
                                       --network ${env.DOCKER_NETWORK} \
                                       -v \$(pwd):/usr/src \
                                       -w /usr/src \
                                       sonarsource/sonar-scanner-cli \
                                       sonar-scanner \
                                       -Dsonar.projectKey=spring-petclinic \
                                       -Dsonar.sources=. \
                               -Dsonar.java.binaries=target/classes \
                                       -Dsonar.host.url=${env.SONARQUBE_URL} \
                                       -Dsonar.login=${env.SONARQUBE_LOGIN}
                                   """
                           echo 'Static analysis completed successfully.'
                       } catch (Exception e) {
                           echo "Error during static analysis: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                   }
                   echo 'Static analysis stage completed.'
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

           stage('Prepare ZAP Analysis using socket') {
               steps {
                   script {
                       try {
                   def serviceAccessible = false
                   for (int i = 0; i < 5; i++) {
                       try {
                           sh "curl -s -o /dev/null -w '%{http_code}' http://192.168.1.2:8082"
                           serviceAccessible = true
                           break
                       } catch (Exception e) {
                           echo "Service not accessible yet, retrying in 30 seconds..."
                           sleep(30)
                       }
                   }

                   if (!serviceAccessible) {
                       error("Service not accessible at http://192.168.1.2:8082")
                   }

                   echo "ZAP_CONTAINER_NAME: ${env.ZAP_CONTAINER_NAME}"
                   echo "DEPLOYMENT_URL: ${env.DEPLOYMENT_URL}"

                   sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} mkdir -p /zap/wrk"
                   sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} zap-baseline.py -t ${env.DEPLOYMENT_URL} -r zap-report.html -I"
                       } catch (Exception e) {
                           echo "Error during preparing ZAP Analysis Script: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                   }
               }
           }

           stage('Copy ZAP Report') {
               steps {
                   script {
                       try {
                           sh "docker cp ${env.ZAP_CONTAINER_NAME}:/zap/wrk/zap-report.html ${env.WORKSPACE}/zap-report.html"
                       } catch (Exception e) {
                           echo "Error during copying ZAP report: ${e}"
                           currentBuild.result = 'FAILURE'
                       }
                   }
               }
           }

           stage('Verify AWS Account') {
               steps {
                   withAWS(credentials: 'aws-credentials') {
                       script {
                           try {
                               sh 'aws sts get-caller-identity'
                           } catch (Exception e) {
                               echo "Error verifying AWS account: ${e}"
                               currentBuild.result = 'FAILURE'
                           }
                       }
                   }
               }
           }

           stage('Open Ports 443 and 8080') {
               steps {
                   withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {
                       script {
                       try {
                               def port443Exists = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --query 'SecurityGroups[*].IpPermissions[?FromPort==`443` && ToPort==`443` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               def port8080Exists = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --query 'SecurityGroups[*].IpPermissions[?FromPort==`8080` && ToPort==`8080` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               if (!port443Exists) {
                                   sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 443 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 443 rule already exists"
                               }

                               if (!port8080Exists) {
                                   sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 8080 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 8080 rule already exists"
                               }
                       } catch (Exception e) {
                               echo "Error opening ports 443, and 8080: ${e.getMessage()}"
                           currentBuild.result = 'FAILURE'
                           throw e
                           }
                       }
                   }
               }
           }

           stage('Check Existing EC2 Instance') {
               steps {
                   withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {
                       script {
                           try {
                               def existingInstances = sh(script: """
                                   aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,PublicIpAddress]" --output text
                               """, returnStdout: true).trim()

                               if (existingInstances) {
                                   def instanceDetails = existingInstances.split()
                                   env.INSTANCE_ID = instanceDetails[0]
                                   env.INSTANCE_IP = instanceDetails[1]
                                   echo "Using existing EC2 Instance ID: ${env.INSTANCE_ID} with IP: ${env.INSTANCE_IP}"
                               } else {
                                   env.INSTANCE_ID = ''
                                   env.INSTANCE_IP = ''
                                   echo "No existing running EC2 instances found. Proceeding to create a new instance."
                               }
                           } catch (Exception e) {
                               echo "Error checking for existing EC2 instances: ${e.getMessage()}"
                               currentBuild.result = 'FAILURE'
                               throw e
                           }
                       }
                   }
               }
           }

           stage('Create EC2 Instance') {
               when {
           expression { !env.INSTANCE_ID || env.INSTANCE_ID.trim() == "" }
               }
               steps {
                   withAWS(credentials: 'aws-credentials') {
                       script {
                           try {
                               env.INSTANCE_ID = sh(script: """
                                   aws ec2 run-instances --image-id ${AMI_ID} --count 1 --instance-type ${INSTANCE_TYPE} --key-name ${KEY_NAME} --security-group-ids ${SECURITY_GROUP_ID} --subnet-id ${SUBNET_ID} --region ${AWS_REGION} --query 'Instances[0].InstanceId' --output text
                               """, returnStdout: true).trim()
                               echo "EC2 Instance ID: ${env.INSTANCE_ID}"
                           } catch (Exception e) {
                               echo "Error creating EC2 instance: ${e.getMessage()}"
                               currentBuild.result = 'FAILURE'
                               throw e
                           }
                       }
                   }
               }
           }

           stage('Configure Security Group') {
               steps {
                   withAWS(credentials: 'aws-credentials') {
                       script {
                           try {
                               def ruleExists22 = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --region ${AWS_REGION} --query 'SecurityGroups[*].IpPermissions[?FromPort==`22` && ToPort==`22` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               if (!ruleExists22) {
                                   sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 22 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 22 rule already exists"
                               }

                               def ruleExists80 = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --region ${AWS_REGION} --query 'SecurityGroups[*].IpPermissions[?FromPort==`80` && ToPort==`80` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               if (!ruleExists80) {
                                   sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 80 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 80 rule already exists"
                               }

                               def ruleExists443 = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --region ${AWS_REGION} --query 'SecurityGroups[*].IpPermissions[?FromPort==`443` && ToPort==`443` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               if (!ruleExists443) {
                                   sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 443 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 443 rule already exists"
                               }

                               def ruleExists8080 = sh(script: """
                                   aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --region ${AWS_REGION} --query 'SecurityGroups[*].IpPermissions[?FromPort==`8080` && ToPort==`8080` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text
                               """, returnStdout: true).trim()

                               if (!ruleExists8080) {
                           sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 8080 --cidr 0.0.0.0/0"
                               } else {
                                   echo "Port 8080 rule already exists"
                               }
                           } catch (Exception e) {
                               echo "Error configuring security group: ${e.getMessage()}"
                               currentBuild.result = 'FAILURE'
                               throw e
                           }
                       }
                   }
               }
           }

           stage('Get EC2 Instance IP') {
               steps {
                   withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {
                       script {
                           def retries = 5
                           def waitTime = 60

                           for (int i = 0; i < retries; i++) {
                           try {
                                   sh "aws ec2 wait instance-running --instance-ids ${env.INSTANCE_ID} --region ${AWS_REGION}"
                                   break
                               } catch (Exception e) {
                                   echo "Attempt ${i + 1} failed: ${e.getMessage()}"
                                   if (i == retries - 1) {
                                       echo "Max attempts reached. Exiting..."
                                       currentBuild.result = 'FAILURE'
                                       throw e
                                   }
                                   echo "Waiting ${waitTime} seconds before retrying..."
                                   sleep(waitTime)
                               }
                           }

                   try {
                           env.INSTANCE_IP = sh(script: """
                                   aws ec2 describe-instances --instance-ids ${env.INSTANCE_ID} --region ${AWS_REGION} --query 'Reservations[0].Instances[0].PublicIpAddress' --output text
                           """, returnStdout: true).trim()

                           echo "EC2 Instance IP: ${env.INSTANCE_IP}"
                           } catch (Exception e) {
                               echo "Error getting EC2 instance IP: ${e.getMessage()}"
                               currentBuild.result = 'FAILURE'
                               throw e
                           }
                       }
                   }
               }
           }


           stage('Copy Ansible Playbook') {
               steps {
                   script {
                       sh 'cp /opt/ansible/deploy-petclinic.yml ${WORKSPACE}/deploy-petclinic.yml'
                   }
               }
           }

           stage('Update Inventory') {
               steps {
                   script {
                       try {
                       writeFile file: 'inventory.ini', text: """
                               [new_ec2]
                               ${env.INSTANCE_IP} ansible_ssh_user=${SSH_USER} ansible_ssh_private_key_file=${LOCAL_SSH_KEY_PATH}
                       """
                       } catch (Exception e) {
                           echo "Error updating inventory: ${e.getMessage()}"
                           currentBuild.result = 'FAILURE'
                           throw e
                       }
                   }
               }
           }

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
           }
       }

       post {
           always {
               echo 'Pipeline execution completed.'
           }
           success {
               echo 'Pipeline completed successfully.'
               archiveArtifacts artifacts: 'zap-report.html', allowEmptyArchive: true
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
     scrape_interval: 15s   scrape_configs:     - job_name: 'jenkins'       static_configs:         - targets: ['jenkins:8080']  
   ```
2. **Grafana Configuration**

   - Log in to Grafana and create dashboards to visualize Jenkins metrics.

## Step 6: Set Up AWS EC2 Instance

### Jenkins file setup

Quick steps to Obtain Required AWS Configuration Information from AWS Console to be set it in the jenkinsfile to run the pipeline:

#### 1. Get SSH User

For an Ubuntu instance, the default SSH user is typically `ubuntu`. This user is predefined when you launch an Ubuntu AMI (Amazon Machine Image).

#### 2. Get AWS Region

**Step 1:** Log in to the AWS Management Console.

**Step 2:** Look at the top right corner of the console page, next to your account name. You will see the current region displayed there (e.g., N. Virginia which corresponds to `us-east-1`).

#### 3. Get AMI ID

**Step 1:** From the AWS Management Console, navigate to the **EC2 Dashboard**.

- Click on **Services** in the top-left corner.
- Under the **Compute** category, select **EC2**.

**Step 2:** Click on **Launch Instance**.

**Step 3:** In the **Choose an Amazon Machine Image (AMI)** step, you can search for "Ubuntu Server 20.04 LTS" under the **Quick Start** tab.

**Step 4:** The AMI ID is listed under the AMI name. For example, `ami-039a6f82dd07a541e` is one such ID for Ubuntu Server 20.04 LTS.

#### 4. Get Instance Type

**Step 1:** While launching an instance, after selecting an AMI, you will be prompted to choose an instance type.

**Step 2:** Select `t2.micro` for a free tier-eligible instance type.

#### 5. Get Key Pair Name

**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Key Pairs** under **Network & Security**.

**Step 2:** If you already have a key pair, the name will be listed there. For example, `petclinic_key_pair`.

**Step 3:** If you do not have a key pair, click on **Create Key Pair**.

- Enter `petclinic_key_pair` as the key pair name.
- Choose the file format (PEM for Linux/Mac, PPK for Windows).
- Click **Create Key Pair** and download the key file.

#### 6. Get Security Group ID

**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Security Groups** under **Network & Security**.

**Step 2:** Select the security group you want to use or create a new one by clicking **Create Security Group**.

- Enter a name and description for the security group.
- Select the VPC (if you have multiple VPCs).
- Add inbound rules (e.g., allow SSH, HTTP, HTTPS).
- Click **Create Security Group**.

**Step 3:** The security group ID will be listed in the **Security Groups** section (e.g., `sg-0fba393f98de9bcbe`).

#### 7. Get Subnet ID

**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Subnets** under **Network & Security**.

**Step 2:** Select the subnet you want to use.

- Ensure the subnet is in the same VPC as your security group.
- The subnet should have auto-assign public IP enabled.

**Step 3:** The subnet ID will be listed in the **Subnets** section (e.g., `subnet-0d2f18bee0a9a0ca1`).

Here's a detailed guide to launching an EC2 instance using the AWS Management Console:

### Step 1: Log in to the AWS Management Console

1. Open a web browser and navigate to the [AWS Management Console](https://aws.amazon.com/console/).
2. Sign in with your AWS account credentials.

### Step 2: Navigate to the EC2 Dashboard

1. From the AWS Management Console, click on **Services** in the top-left corner.
2. Under the **Compute** category, select **EC2**.

### Step 3: Launch an Instance

1. On the EC2 Dashboard, click the **Launch Instance** button.

### Step 4: Choose an Amazon Machine Image (AMI)

1. Select an AMI based on your requirements. For this guide, we'll use **Ubuntu Server 20.04 LTS**.
   - You can find this AMI by searching for "Ubuntu Server 20.04 LTS" in the **Quick Start** tab.
2. Click the **Select** button next to your chosen AMI.

### Step 5: Choose an Instance Type

1. Select an instance type based on your needs. For most purposes, the **t2.micro** instance type is sufficient and falls under the Free Tier eligibility.
2. Click the **Next: Configure Instance Details** button.

### Step 6: Configure Instance Details

1. **Number of instances:** Keep it as 1.
2. **Network:** Select the VPC you want to launch your instance in. If you don't have a VPC, the default VPC will be selected.
3. **Subnet:** Choose a subnet within your VPC. Ensure that the subnet has auto-assign public IP enabled, or select **Enable** under the **Auto-assign Public IP** dropdown.
4. **Auto-assign Public IP:** Ensure that this is set to **Enable** if it is not already enabled.
5. **IAM role:** If you have an IAM role you want to attach to this instance, select it here. Otherwise, you can leave it as **None**.
6. Leave all other settings as default unless you have specific requirements.
7. Click the **Next: Add Storage** button.

### Step 7: Add Storage

1. The default storage configuration should suffice, but you can adjust the storage size and type if necessary.
   - For example, you might want to increase the storage size from the default 8 GB to 20 GB.
2. Click the **Next: Add Tags** button.

### Step 8: Add Tags

1. (Optional) Add tags to help identify your instance. Tags are key-value pairs.
   - For example, you could add a tag with **Key:** `Name` and **Value:** `MyFirstEC2Instance`.
2. Click the **Next: Configure Security Group** button.

### Step 9: Configure Security Group

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

### Step 10: Review and Launch

1. Review your instance configuration.
2. Click the **Launch** button.

### Step 11: Select an Existing Key Pair or Create a New Key Pair

1. In the **Select an existing key pair or create a new key pair** dialog box, choose **Create a new key pair**.
2. Provide a name for the key pair, such as `my-ec2-key`.
3. Click the **Download Key Pair** button to download the `.pem` file (e.g., `my-ec2-key.pem`). **Note:** Keep this file secure as it is required to SSH into your instance.
4. Click the **Launch Instances** button.

### Step 12: View Your Instances

1. Click the **View Instances** button to return to the EC2 Dashboard.
2. Your new instance will be listed. Initially, the instance state will be **Pending**. Wait for the instance state to change to **Running**.

### Step 13: SSH into Your EC2 Instance

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
2. **Create Ansible Playbook**

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

   - Add the following stages to the `Jenkinsfile` to run the Ansible playbook:

   ```groovy

           stage('Copy Ansible Playbook') {
               steps {
                   script {
                       sh 'cp /opt/ansible/deploy-petclinic.yml ${WORKSPACE}/deploy-petclinic.yml'
                   }
               }
           }

           stage('Update Inventory') {
               steps {
                   script {
                       try {
                       writeFile file: 'inventory.ini', text: """
                               [new_ec2]
                               ${env.INSTANCE_IP} ansible_ssh_user=${SSH_USER} ansible_ssh_private_key_file=${LOCAL_SSH_KEY_PATH}
                       """
                       } catch (Exception e) {
                           echo "Error updating inventory: ${e.getMessage()}"
                           currentBuild.result = 'FAILURE'
                           throw e
                       }
                   }
               }
           }

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
           }


   ```

## Step 9: Verify the Setup

1. **Verify Application Deployment**

   - Ensure the spring-petclinic application is running on the EC2 instance and accessible at `http://ec2-public-dns:8082`.
2. **Test Automated Build and Deployment**

   - Make and push a code change to the GitHub repository.
   - Verify Jenkins automatically builds, tests, and deploys the new version, and the content change is reflected in the deployed application.

# Issues
