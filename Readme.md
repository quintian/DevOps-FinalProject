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

## Also Tested on: Windows 11 Education Edition
    1. OS Host Details:
        Processor	Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz   2.59 GHz
        Installed RAM	16.0 GB (15.8 GB usable)
        Product ID	00328-00805-52422-AA517
        System type	64-bit operating system, x64-based processor

    2. Windows Details:
        Windows 11 Education Edition
    
    3. All Linux was through WSL2, (i.e., Through Docker Desktop using WSL installation.):
        WSL version: 2.2.4.0
        Kernel version: 5.15.153.1-2
        WSLg version: 1.0.61
        MSRDC version: 1.2.5326
        Direct3D version: 1.611.1-81528511
        DXCore version: 10.0.26091.1-240325-1447.ge-release
        Windows version: 10.0.22631.3880



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

## Step 0: 

The pipeline ultimately deploys the application onto a VM hosted by AWS (Free tier!). As a result, there are necessary configurations that must be done prior to instantiating any containers. Start here. As the AWS setup continues, you will need to add specific credentials/configurations generated by AWS to a jenkinsfile. Thus, start by creating a Jenkinsfile with just the pipeline and some environmental variables to be filled in, specifcally, "AMI_ID", "SECURITY_GROUP_ID", and "SUBNET_ID". Once setup is complete, you'll be able to get these configurations as necessary from the Instance Summary page for that EC2 instance, as here:
    ![[./screenshots/F0X_EC2_InstanceSummary.png]]

You will need to start with your Jenkinsfile as such, and fill in teh missing environmental variables as AWS creates them.

```groovy 

pipeline {
    agent any

    environment {
        // AWS Environmental Variables:
        AMI_ID = 
        SECURITY_GROUP_ID = 
        SUBNET_ID =
        SSH_USER = 'ubuntu'
        AWS_REGION = 'us-east-1'
        INSTANCE_TYPE = 't2.micro'
        KEY_NAME = 'petclinic_key_pair'
        // Other Variables:
        PROJECT_NAME = 'devops-finalproject-akash'
        DOCKER_NETWORK = "${PROJECT_NAME}_dev-network"
        JENKINS_URL = '10.120.64.242:8080'
        ZAP_CONTAINER_NAME = 'owasp-zap'
        ZAP_URL = 'http://192.168.1.6:8081'
        SONARQUBE_URL = 'http://192.168.1.3:9000'
        DEPLOYMENT_URL = 'http://192.168.1.2:8082'
        LOCAL_SSH_KEY_PATH = '/root/.ssh/petclinic_key_pair.pem'
        JAR_FILE = '/target/spring-petclinic-3.3.0-SNAPSHOT.jar'
        GITHUB_REPO = "akashcha/spring-petclinic"
        WEBHOOK_URL = "http://${JENKINS_URL}/github-webhook/"
        PROMETHEUS_URL = 'http://192.168.1.4:9090'
        GRAFANA_URL = 'http://192.168.1.5:3000'
    }
}

```

#### 1. Assign SSH User

For an Ubuntu instance, the default SSH user is typically `ubuntu`. This user is predefined when you launch an Ubuntu AMI (Amazon Machine Image).

#### 2. Get AWS Region while setting up AWS EC2 Instance

**Step 1:** Log in to the AWS Management Console. (Same as outlined above.)

**Step 2:** Look at the top right corner of the console page, next to your account name. You will see the current region displayed there (e.g., N. Virginia which corresponds to `us-east-1`).

#### 3. Get AMI ID

**Step 1:** From the AWS Management Console, navigate to the **EC2 Dashboard**.

- Click on **Services** in the top-left corner.
- Under the **Compute** category.
    ![[./screenshots/F00_EC2_gotoCompute.png]]
- Select **EC2**.
    ![[./screenshots/F01_EC2_selectEC2.png]]

**Step 2:** Click on **Launch Instance**.
    ![[./screenshots/F02_EC2_clickLaunchInstance.png]]

**Step 3:** In the **Choose an Amazon Machine Image (AMI)** step, you can search for "Ubuntu Server 20.04 LTS" under the **Quick Start** tab.

**Step 4:** The AMI ID is listed under the AMI name. For example, `ami-039a6f82dd07a541e` is one such ID for Ubuntu Server 20.04 LTS.
    - Step 3 and 4 are seen here:
    ![[./screenshots/F03_EC2_configureInstance.png]]

#### 4. Get Instance Type

**Step 1:** While launching an instance, after selecting an AMI, you will be prompted to choose an instance type.

**Step 2:** Select `t2.micro` for a free tier-eligible instance type.
    ![[./screenshots/F03_EC2_pickMicro.png]]

#### 5. Get Key Pair Name

**Step 1:** Click on "Create new key pair" as seen in the screenshot below while you create yourEc2 instance. If you are disconnected, you can create a key pair manually by navigating to the **EC2 Dashboard**, in the left navigation pane, click **Key Pairs** under **Network & Security**. If you already have a key pair, the name will be listed there. For example, `petclinic_key_pair`.If you do not have a key pair, click on **Create Key Pair**.
![[./screenshots/F04_EC2_clickCreateKeyPair.png]]

**Step 2:** 

- Enter `petclinic_key_pair` as the key pair name.
- Choose the file format Because we are using a Debian image, we used a PEM key. 
- Click **Create Key Pair** and download the key file.
![[./screenshots/F05_EC2_createKeyPair.png]]
  **Step 4**: Download and Store the Key File
- **Download the Key File:** Save the private key file in a secure location. You will need this file to connect to your EC2 instance.

  - **Linux/MacOS:** The file will be named something like `petclinic_key_pair.pem`.
  - **Windows:** The file will be named something like `petclinic_key_pair.ppk`. (Use if you created a windows container; we did not. Included only for completeness.)

- In our application, you will have to store the private key in the following location on jenkins: /root/.ssh/
- This will be done during the jenkins container build process. In order to build correctly, the files "petclinic_key_pair.pem" and "petclinic_key_pair.pem.pun" need to be in a subdirectory "key" of the directory that "docker compose up -d" is executed from. In our Jenkins Dockerfile, the build process will copy these files into the Jenkins build, providing it access to the EC2 instance. For that reason, the first time the EC2 instance is configured, it must be configured and keys generated before *any other configuration of Jenkins, to include building the container* can occur. At this time, the keys are *already stored* in the directory, so a simple "docker compose up -d" automatically configures Jenkins to connect to the EC2 instance.

#### 6. Get Security Group ID

**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Security Groups** under **Network & Security**. Alternatively, use the builtin windows that are available in teh EC2 instance configuration, as shown in the screenshot:
    ![[./screenshots/F06_EC2_createSecurityGroup.png]]

**Step 2:** Select the security group you want to use or create a new one by clicking **Create Security Group**.

- Enter a name and description for the security group. (or use the default, in our case, "launch-wizard-1")
- Select the VPC (if you have multiple VPCs). (We do not)
- Add inbound rules (e.g., allow SSH, HTTP, HTTPS). (Allow all three)
It will look like this:
    ![[./screenshots/F07_EC2_configSecurityGroup.png]] F09_EC2_choose Subnet
- Click **Create Security Group**.

**Step 3:** The security group ID will be listed in the **Security Groups** section (e.g., `sg-0fba393f98de9bcbe`).

#### 7. Configure Storage

    - AWS allows up to 30GB of storage in free tier, so allocate 15 GB for this instance. (Way more than enough.).

    ![[./screenshots/F08_EC2_configStorage.png]]
    

#### 8. Get Subnet ID

**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Subnets** under **Network & Security**. Again, this can be done in the wizard for a new EC2 instance, as shown in the screenshots below.

**Step 2:** Select the subnet you want to use.

- Ensure the subnet is in the same VPC as your security group. (In the base case, this occurs by default.)
- The subnet should have auto-assign public IP enabled. (Again, this will be the default.) 
    

**Step 3:** The subnet ID will be listed in the **Subnets** section (e.g., `subnet-004586e6912be07d4`). This may not be visible by default, so click "edit" net to "Network Settings" and then select a subnet.
    ![[./screenshots/F09_EC2_chooseSubnet.png]] 

**Step 4:** Click "Launch Instance." A successful launch will look like this:
    ![[./screenshots/F10_EC2_launchSuccess.png]] 

**Step 5:** If you have been updating your Jenkinsfile as you go, it should now look something like this:

```groovy

pipeline {
    agent any

    environment {
        // AWS Environmental Variables:
        AMI_ID = 'ami-04a81a99f5ec58529'
        SECURITY_GROUP_ID = 'sg-08c1cd700d0c96d77'
        SUBNET_ID = 'subnet-004586e6912be07d4'
        SSH_USER = 'ubuntu'
        AWS_REGION = 'us-east-1'
        INSTANCE_TYPE = 't2.micro'
        KEY_NAME = 'petclinic_key_pair'
        // Other Variables:
        PROJECT_NAME = 'devops-finalproject-akash'
        DOCKER_NETWORK = "${PROJECT_NAME}_dev-network"
        JENKINS_URL = '10.120.64.242:8080'
        ZAP_CONTAINER_NAME = 'owasp-zap'
        ZAP_URL = 'http://192.168.1.6:8081'
        SONARQUBE_URL = 'http://192.168.1.3:9000'
        DEPLOYMENT_URL = 'http://192.168.1.2:8082'
        LOCAL_SSH_KEY_PATH = '/root/.ssh/petclinic_key_pair.pem'
        JAR_FILE = '/target/spring-petclinic-3.3.0-SNAPSHOT.jar'
        GITHUB_REPO = "akashcha/spring-petclinic"
        WEBHOOK_URL = "http://${JENKINS_URL}/github-webhook/"
        PROMETHEUS_URL = 'http://192.168.1.4:9090'
        GRAFANA_URL = 'http://192.168.1.5:3000'
    }
}


```

## Step 1: Installing Docker on Mac. Now that you have EC2 configured, install Docker.

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
      ![[./screenshots/8_Either_create_an_account_on_docker_or_sign_in_using_existing_account.png]]
   9. Signing in using existing docker account. 
      ![[./screenshots/9_Signing_in_using_existing_docker_account.png]]
   10. Docker is installed and signed-in. Now proceed to the docker desktop app.
       ![[./screenshots/11_Docker_is_installed_and_signed-in_proceed.png]]
   11. Check if docker is installed by checking the docker version
       ![[./screenshots/12_Check_if_docker_is_installed_by_checking_the_docker_version.png]]
   12. Run hello-world test just to make sure everything is working fine.
       ![[./screenshots/13_Run_hello-world_test_just_to_make_sure_everything_is_work_fine.png]]
   13. Check on the docker app if the hello-world container instance ran and exited as expected
       ![[./screenshots/14_Check_on_the_docker_app_if_the_hello-world_container_instance_ran_and_exited_as_expected.png]]

## Step 2: Set Up Docker Containers

### Fork and Clone Repository

- Fork the [spring-petclinic](https://github.com/spring-projects/spring-petclinic) repository on GitHub/GitLab.
- Clone the forked repository to your local machine.

### Project Structure

Below is the text representation of the project structure shown in the image:

```
DevOps-FinalProject-Akash
├── ansible
│   ├── deploy-petclinic.yml
│   └── inventory.ini
├── grafana
│   └── provisioning
│       └── datasources
│           └── prometheus.yml
├── spring-petclinic
├── key
│   └── petclinic_key_pair.pem
├── prometheus
│   └── prometheus.yml
├── screenshots
├── docker-compose.yml
├── grafana.ini
├── jenkins_dockerfile
├── Jenkinsfile
└── Readme.md
```

### Create Docker Containers

#### Create Jenkins container

Create Jenkins container using a dockerfile (Jenkinsfile) including all the plugins that may be required for accomplish the all the tasks. We use a custom script to create jenkins docker container. Do not instantiate the container yet; this will occur later in the process. Just build the file for now:

```docker
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

##### Explanation: Detailed Breakdown of Each Command

```Dockerfile
# Use the official Jenkins LTS (Long Term Support) image as the base image
FROM jenkins/jenkins:lts
```

- **FROM jenkins/jenkins:lts**: This sets the base image for the Dockerfile to the official Jenkins LTS image, which includes the Jenkins application and all necessary dependencies to run it.

```Dockerfile
# Switch to the root user to perform installation tasks
USER root
```

- **USER root**: This switches the user to `root` so that we have the necessary permissions to install additional packages and perform configurations.

```Dockerfile
# Update the package list and install sudo and Maven
RUN apt-get update \
	&& apt-get install -y sudo \
	&& apt-get install -y maven \
	&& rm -rf /var/lib/apt/lists/*
```

- **RUN apt-get update**: Updates the list of available packages and their versions.
- **&& apt-get install -y sudo**: Installs the `sudo` package, which allows a permitted user to execute a command as the superuser or another user.
- **&& apt-get install -y maven**: Installs Apache Maven, a build automation tool used primarily for Java projects.
- **&& rm -rf /var/lib/apt/lists/**: Cleans up the package lists to reduce the image size, which is a good practice to keep the Docker image small and efficient.

```Dockerfile
# Optionally set up Maven environment variables for easy access
ENV MAVEN_HOME /usr/share/maven
ENV PATH $MAVEN_HOME/bin:$PATH
```

- **ENV MAVEN_HOME /usr/share/maven**: Sets the `MAVEN_HOME` environment variable to the location where Maven is installed.
- **ENV PATH $MAVEN_HOME/bin:$PATH**: Adds Maven’s `bin` directory to the `PATH` environment variable so that Maven commands can be run from anywhere.

```Dockerfile
# Allow the Jenkins user to run sudo commands without a password
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
```

- **RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers**: Modifies the sudoers file to allow the `jenkins` user to execute `sudo` commands without needing to enter a password. This is important for automating tasks that require elevated privileges.

```Dockerfile
# Install necessary packages for Docker and other tools
RUN sudo apt-get update \
	&& sudo apt-get install ca-certificates curl unzip \
	&& sudo install -m 0755 -d /etc/apt/keyrings \
	&& sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
	&& sudo chmod a+r /etc/apt/keyrings/docker.asc
```

- **sudo apt-get update**: Updates the list of available packages and their versions.
- **sudo apt-get install ca-certificates curl unzip**: Installs the necessary packages for handling HTTPS connections (`ca-certificates`), transferring data with URLs (`curl`), and unzipping files (`unzip`).
- **sudo install -m 0755 -d /etc/apt/keyrings**: Creates a directory for storing keyrings with the appropriate permissions.
- **sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc**: Downloads Docker’s official GPG key and saves it to the keyrings directory.
- **sudo chmod a+r /etc/apt/keyrings/docker.asc**: Changes the permissions of the GPG key file to make it readable by all users.

```Dockerfile
# Add Docker's official GPG key and repository
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN sudo apt-get update
```

- **RUN echo ...**: Adds Docker’s official repository to the sources list for the package manager. The repository URL is determined based on the current system’s architecture and OS version.
- **RUN sudo apt-get update**: Updates the package list to include the packages available from the newly added Docker repository.

```Dockerfile
# Install Docker, Docker Compose, and other necessary packages
RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```

- **RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y**: Installs Docker Engine (`docker-ce`), Docker CLI (`docker-ce-cli`), Containerd (`containerd.io`), Docker Buildx plugin (`docker-buildx-plugin`), and Docker Compose plugin (`docker-compose-plugin`).

```Dockerfile
# Install iproute2 for networking tools
RUN sudo apt-get install iproute2 -y
```

- **RUN sudo apt-get install iproute2 -y**: Installs `iproute2`, a collection of utilities for controlling and monitoring networking, routing, and traffic control in Linux.

```Dockerfile
# Install Ansible for automation and configuration management
RUN sudo apt-get install ansible -y
```

- **RUN sudo apt-get install ansible -y**: Installs Ansible, an open-source automation tool for configuration management, application deployment, and task automation.

```Dockerfile
# Install OpenSSH server for SSH functionalities
RUN sudo apt-get install openssh-server -y
```

- **RUN sudo apt-get install openssh-server -y**: Installs OpenSSH server, which allows the container to handle SSH connections.

```Dockerfile
# Update the package list and install curl, gnupg, and apt-transport-https for downloading the AWS CLI
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https
```

- **RUN apt-get update && apt-get install -y curl gnupg apt-transport-https**: Updates the package list and installs `curl` (for transferring data with URLs), `gnupg` (for encryption and signing data and communications), and `apt-transport-https` (for accessing repositories over HTTPS).

```Dockerfile
# Install AWS CLI for managing AWS resources
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install
```

- **RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip"**: Downloads the AWS CLI installer for the appropriate architecture.
- **&& unzip awscliv2.zip**: Unzips the downloaded AWS CLI installer.
- **&& sudo ./aws/install**: Runs the AWS CLI installer.

```Dockerfile
# Copy the SSH key to a specific location in the Docker image for secure access
COPY key/petclinic_key_pair.pem /root/.ssh/petclinic_key_pair.pem
COPY key/petclinic_key_pair.pem.pub /root/.ssh/petclinic_key_pair.pem.pub
RUN chmod 600 /root/.ssh/petclinic_key_pair.pem
```

- **COPY key/petclinic_key_pair.pem /root/.ssh/petclinic_key_pair.pem**: Copies the private SSH key to the specified location in the Docker image.
- **COPY key/petclinic_key_pair.pem.pub /root/.ssh/petclinic_key_pair.pem.pub**: Copies the public SSH key to the specified location in the Docker image.
- **RUN chmod 600 /root/.ssh/petclinic_key_pair.pem**: Changes the permissions of the private SSH key to make it readable only by the owner, ensuring security.

```Dockerfile
# Switch back to the Jenkins user
USER jenkins
```

- **USER jenkins**: Switches the user back to `jenkins` for the remaining operations.

```Dockerfile
# Install necessary Jenkins plugins using the Jenkins Plugin CLI
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
```

- **RUN jenkins-plugin-cli --plugins ...**: Uses the Jenkins Plugin CLI to install a list of essential Jenkins plugins. Each plugin is specified by its identifier and version (if needed). These plugins provide various functionalities, such as Docker integration (`docker-workflow`), pipeline support (`workflow-aggregator`), static analysis (`sonar`), monitoring (`prometheus`), security analysis (`zap`), version control (`git`), and AWS integration (`aws-credentials`, `pipeline-aws`).

```Dockerfile
# Copy Ansible playbooks or configuration files to the Docker image
COPY ansible /opt/ansible
```

- **COPY ansible /opt/ansible**: Copies the Ansible playbooks or configuration files from the host machine to the specified directory in the Docker image.

```Dockerfile
# Override the default entrypoint to start Docker service and then Jenkins
ENTRYPOINT ["/bin/sh", "-c" , "sudo service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh "]
```

- **ENTRYPOINT ["/bin/sh", "-c" , "sudo service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh "]**: Overrides the default entrypoint to first start the Docker service (`sudo service docker start`) and then start Jenkins using Tini (`/usr/bin/tini -- /usr/local/bin/jenkins.sh`). Tini is used to ensure proper handling of signal forwarding and zombie reaping.

#### Create docker compose for all other containers

Create docker compose (docker-compose.yml) that creates all the containers with appropriate configs and custom docker network. This Docker compose file will reference the Dockerfile written for Jenkins:

```bash
services:  
jenkins:  
  container_name: jenkins  
  build:  
    context: .  
    dockerfile: jenkins_dockerfile  
  user: root  
  privileged: true  
  ports:  
    - "8080:8080"  
    - "50000:50000"  
    - "8082:8082" # For spring-petclinic app  
    - "8084:8084" # For OWASP-ZAP exposure  
  volumes:  
    - /var/run/docker.sock:/var/run/docker.sock # Mount Docker socket  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.2  
  entrypoint: ["/bin/sh", "-c" , "sudo service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh "]  

sonarqube:  
  image: sonarqube:latest  
  container_name: sonarqube  
  depends_on:  
    - db  
  ports:  
    - "9000:9000"  
  environment:  
    - SONAR_JDBC_URL=jdbc:postgresql://db:5432/sonar  
    - SONAR_JDBC_USERNAME=sonar  
    - SONAR_JDBC_PASSWORD=sonar  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.3  

db:  
  image: postgres:13  
  container_name: postgres  
  environment:  
    - POSTGRES_USER=sonar  
    - POSTGRES_PASSWORD=sonar  
    - POSTGRES_DB=sonar  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.7  


prometheus:  
  image: prom/prometheus:latest  
  container_name: prometheus  
  ports:  
    - "9090:9090"  
  volumes:  
    - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml  
  command:  
    - '--config.file=/etc/prometheus/prometheus.yml'  
    - '--storage.tsdb.path=/prometheus'  
    - '--web.console.libraries=/etc/prometheus/console_libraries'  
    - '--web.console.templates=/etc/prometheus/consoles'  
    - '--web.enable-lifecycle'  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.4  

grafana:  
  image: grafana/grafana:latest  
  container_name: grafana  
  ports:  
    - "3000:3000"  
  environment:  
    - GF_SECURITY_ADMIN_USER=admin  
    - GF_SECURITY_ADMIN_PASSWORD=admin  
  volumes:  
    - ./grafana.ini:/etc/grafana/grafana.ini  
    - ./grafana/provisioning:/etc/grafana/provisioning  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.5  

owasp-zap:  
  image: zaproxy/zap-weekly  
  container_name: owasp-zap  
  entrypoint: ["zap.sh", "-daemon", "-host", "0.0.0.0", "-port", "8081"]  
  ports:  
    - "8081:8081"  
  networks:  
    dev-network:  
      ipv4_address: 192.168.1.6  
  healthcheck:  
    test: ["CMD", "zap-cli", "status", "-t", "60"]  
    interval: 1m  
    timeout: 30s  
    retries: 3  
    start_period: 30s  

networks:  
dev-network:  
  driver: bridge  
  ipam:  
    config:  
      - subnet: 192.168.1.0/24
```

##### Explanation of `docker-compose.yml` Commands

- Services

This section defines the different services (containers) to be run by Docker Compose.

- Jenkins Service

```yaml
jenkins:
  container_name: jenkins
  build:
    context: .
    dockerfile: jenkins_dockerfile
  user: root
  privileged: true
  ports:
    - "8080:8080"
    - "50000:50000"
    - "8082:8082" # For spring-petclinic app
    - "8084:8084" # For OWASP-ZAP exposure
  volumes:
    - /var/run/docker.sock:/var/run/docker.sock # Mount Docker socket
  networks:
    dev-network:
      ipv4_address: 192.168.1.2
  entrypoint: ["/bin/sh", "-c" , "sudo service docker start && /usr/bin/tini -- /usr/local/bin/jenkins.sh "]
```

- **container_name**: Assigns a name to the container.
- **build**:

  - **context**: Sets the build context to the current directory.
  - **dockerfile**: Specifies the Dockerfile to use for building the image.
- **user**: Sets the user as `root` to execute commands with root privileges.
- **privileged**: Allows the container to run in privileged mode, giving it extended privileges.
- **ports**: Maps host ports to container ports:

  - `8080:8080`: Jenkins web UI.
  - `50000:50000`: Jenkins agent connections.
  - `8082:8082`: Spring PetClinic app.
  - `8084:8084`: OWASP ZAP exposure.
- **volumes**: Mounts the Docker socket to the container to allow Docker commands within Jenkins.
- **networks**: Connects the container to a custom network with a specified IP address.
- **entrypoint**: Sets the command to run when the container starts. It starts the Docker service and Jenkins.
- SonarQube Service

```yaml
sonarqube:
  image: sonarqube:latest
  container_name: sonarqube
  depends_on:
    - db
  ports:
    - "9000:9000"
  environment:
    - SONAR_JDBC_URL=jdbc:postgresql://db:5432/sonar
    - SONAR_JDBC_USERNAME=sonar
    - SONAR_JDBC_PASSWORD=sonar
  networks:
    dev-network:
      ipv4_address: 192.168.1.3
```

- **image**: Uses the latest SonarQube image from Docker Hub.
- **container_name**: Assigns a name to the container.
- **depends_on**: Specifies that SonarQube depends on the `db` service.
- **ports**: Maps host port 9000 to container port 9000 (SonarQube web UI).
- **environment**: Sets environment variables for database configuration.
- **networks**: Connects the container to a custom network with a specified IP address.
- Database Service (PostgreSQL)

```yaml
db:
  image: postgres:13
  container_name: postgres
  environment:
    - POSTGRES_USER=sonar
    - POSTGRES_PASSWORD=sonar
    - POSTGRES_DB=sonar
  networks:
    dev-network:
      ipv4_address: 192.168.1.7
```

- **image**: Uses PostgreSQL version 13 image from Docker Hub.
- **container_name**: Assigns a name to the container.
- **environment**: Sets environment variables for database credentials and database name.
- **networks**: Connects the container to a custom network with a specified IP address.
- Prometheus Service

```yaml
prometheus:
  image: prom/prometheus:latest
  container_name: prometheus
  ports:
    - "9090:9090"
  volumes:
    - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
  command:
    - '--config.file=/etc/prometheus/prometheus.yml'
    - '--storage.tsdb.path=/prometheus'
    - '--web.console.libraries=/etc/prometheus/console_libraries'
    - '--web.console.templates=/etc/prometheus/consoles'
    - '--web.enable-lifecycle'
  networks:
    dev-network:
      ipv4_address: 192.168.1.4
```

- **image**: Uses the latest Prometheus image from Docker Hub.
- **container_name**: Assigns a name to the container.
- **ports**: Maps host port 9090 to container port 9090 (Prometheus web UI).
- **volumes**: Mounts the Prometheus configuration file from the host to the container.
- **command**: Specifies the Prometheus startup commands and configurations.
- **networks**: Connects the container to a custom network with a specified IP address.
- Grafana Service

```yaml
grafana:
  image: grafana/grafana:latest
  container_name: grafana
  ports:
    - "3000:3000"
  environment:
    - GF_SECURITY_ADMIN_USER=admin
    - GF_SECURITY_ADMIN_PASSWORD=admin
  volumes:
    - ./grafana.ini:/etc/grafana/grafana.ini
    - ./grafana/provisioning:/etc/grafana/provisioning
  networks:
    dev-network:
      ipv4_address: 192.168.1.5
```

- **image**: Uses the latest Grafana image from Docker Hub.
- **container_name**: Assigns a name to the container.
- **ports**: Maps host port 3000 to container port 3000 (Grafana web UI).
- **environment**: Sets environment variables for Grafana admin credentials.
- **volumes**: Mounts the Grafana configuration and provisioning files from the host to the container.
- **networks**: Connects the container to a custom network with a specified IP address.
- OWASP ZAP Service

```yaml
owasp-zap:
  image: zaproxy/zap-weekly
  container_name: owasp-zap
  entrypoint: ["zap.sh", "-daemon", "-host", "0.0.0.0", "-port", "8081"]
  ports:
    - "8081:8081"
  networks:
    dev-network:
      ipv4_address: 192.168.1.6
  healthcheck:
    test: ["CMD", "zap-cli", "status", "-t", "60"]
    interval: 1m
    timeout: 30s
    retries: 3
    start_period: 30s
```

- **image**: Uses the latest OWASP ZAP weekly image from Docker Hub.
- **container_name**: Assigns a name to the container.
- **entrypoint**: Specifies the command to run OWASP ZAP in daemon mode.
- **ports**: Maps host port 8081 to container port 8081 (OWASP ZAP web UI).
- **networks**: Connects the container to a custom network with a specified IP address.
- **healthcheck**: Defines health check parameters to monitor the container's status.
- Networks

This section defines the custom network to be used by the services.

```yaml
networks:
  dev-network:
    driver: bridge
    ipam:
      config:
        - subnet: 192.168.1.0/24
```

- **driver: bridge**: Specifies that the network uses the bridge driver.
- **ipam**: Configures IP address management for the network.
  - **subnet: 192.168.1.0/24**: Defines the subnet for the custom network, allowing IP addresses from 192.168.1.1 to 192.168.1.254.

## Step 3: High-level setup

By following these steps, you can create and store the necessary credentials required in Jenkins pipeline and use them securely in your pipeline. The necessary credentials are:

1) grafana-admin-pass
2) github-token
3) aws-credentials
4) ssh key creation and sharing
5) AWS related information

In order to have a place to store these credentials, you must instantiate your containers. This is the first time you will run a command. 

### 0. Instantiate the containers to configure them.

1. If you don't already have Docker Desktop started, start it. 
2. Run the following command from the main project directory.
    ```bash
        docker compose up -d
    ```
    This command instantiates the volumes, networks, and containers required.
    Screenshot:  ![[./screenshots/A01_docker_compose_up_-d.png]] 
    If this is the first time you have ever built the containers, you will see something like this as they get built: 
    Screenshot:  ![[./screenshots/A00_docker_compose_up_-d_first_time.png]] 
    As the Jenkins container builds for the first time, you will see something like this:
    Screenshot:  ![[./screenshots/A001_docker_compose_up_-d_first_time_jenkins_build.png]] 
    Ultimately, the starting printouts will look the same: 
    Screenshot: ![[./screenshots/A002_docker_compose_up_-d_first_time_start.png]]
3. You will now need to do administrative setup of Jenkins. First, navigate to localhost:8080 in your browser:
    Screenshot:  ![[./screenshots/A02_Jenkins_splashScreen.png]] 
4. To get the administrative password, go to Docker Desktop, click on Jenkins
    Screenshot:  ![[./screenshots/A03_Jenkins_openContainer.png]] 
5. Now click on "Logs"
    Screenshot:  ![[./screenshots/A04_Jenkins_logs.png]] 
6. And copy the provided password. Alternatively, this will be available in the terminal (after lots of searching) if you run the docker compose up command *without* the -d flag.
    Screenshot:  ![[./screenshots/A05_Jenkins_logs_copyPassword.png]] 
7. Paste this into the Jenkins Password bar:
    Screenshot:  ![[./screenshots/A05_Jenkins_paste_password.png]] 
8. Because our plugins were programmatically installed in the Jenkins container as specified in the Dockerfile during the build process, there is no need to install the suggested plugins, and you can exit out of the landing screen. Click the "x" in the top right hand corner.
    Screenshot: ![[./screenshots/A06_Jenkins_bypassLanding.png]] 
9. Jenkins is now setup. Click "Start using Jenkins"
    Screenshot: ![[./screenshots/A07_Jenkins_startUsing.png]] 


Here are the steps to create and store the `github-token`, `aws-credentials`, and `grafana-admin-pass` credentials in Jenkins:

### 1. GitHub Token

#### Create a GitHub Token for creation of webhooks.

1. **Log in to GitHub**:

   - Go to [GitHub](https://github.com/) and log in to your account.
2. **Generate a New Token**:

   - Click on your profile picture in the top right corner and select `Settings`.
    ![[./screenshots/15_githubToken_select_settings.png]] 
   - In the left sidebar, click on `Developer settings`.
    ![[./screenshots/16_githubToken_developer_settings.png]]
   - Click on `Personal access tokens`.
    ![[./screenshots/17_githubToken_fineGrainedTokens.png]] 
   - Click on `Generate new token`. We used a fine-grained token.  
    ![[./screenshots/18_githubToken_generateToken.png]] 
   - Give your token a descriptive name (e.g., `Jenkins Token`).
    ![[./screenshots/19_githubToken_nameToken.png]] 
   - Select the scopes you need for your project (e.g., `repo` for repository access). Provide access to the forked pet clinic repo.
    ![[./screenshots/20_githubToken_scopeToken.png]] 
   - Click `Repository permissions`
    ![[./screenshots/21_githubToken_repoClick.png]] 
   - Select webhooks under permissions.
    ![[./screenshots/22_githubToken_webHooks.png]] 
   - Click on `Generate token`.
    ![[./screenshots/23_githubToken_generateToken.png]] 
   - Copy the token. You will need it for the next step. (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)
    ![[./screenshots/24_githubToken_copyToken.png]] 

#### Store GitHub Token in Jenkins

1. **Log in to Jenkins**: 
   - Navigate to your Jenkins instance by going to localhost:8080
   ![[./screenshots/B01_tokenSetup_NavigateToJenkins.png]]  
2. **Add the Token to Jenkins Credentials**:

   - Go to `Manage Jenkins` > `Manage Credentials`.
    ![[./screenshots/B02_tokenSetup_clickManageJenkins.png]]
   - Click on `Add Credentials`.
    ![[./screenshots/B03_tokenSetup_clickManageCredentials.png]]  
   - Select a domain (e.g., `Global`). 
    ![[./screenshots/B04_tokenSetup_clickGlobal.png]] 
   - Click "adding some credentials"
    ![[./screenshots/B05_tokenSteup_addCredentials.png]] 
   - Select `Secret text` as the kind.
    ![[./screenshots/B06_tokenSteup_selectSecretText.png]] 
   - Paste the GitHub token in the `Secret` field and give it an ID `github-token`, optionally a description, then click 'Create'
    ![[./screenshots/B07_tokenSteup_createSecretText.png]] 

3. Using GitHub Token
   - The reason to do this is to use that token via a reference in the Jenkinsfile, i.e.:

```groovy
environment {
    GITHUB_TOKEN = credentials('github-token')
}
```

### 2. AWS Credentials

#### Create AWS Access Key and Secret Key

1. **Log in to AWS Management Console**:

   - Go to [AWS Management Console](https://aws.amazon.com/console/).
    ![[./screenshots/C01_AWS_console.png]]  
   - Log into your account. You will land on different pages, depending on your region, but Pittsburgh points here:
    ![[./screenshots/C02_AWS_landing.png]] 

2. **Generate Access Keys**:

   - Click on your account name in the top right corner and select `My Security Credentials`.
    ![[./screenshots/C03_AWS_selectSecurityCredentials.png]]  
   - In the left sidebar, click on `Users`.
    ![[./screenshots/C04_AWS_selectUsers.png]]  
   - Select the user you want to create access keys for (or create a new user with programmatic access).
    ![[./screenshots/C05_AWS_createNewUser.png]] 
   - If creating a new user, name them something:
    ![[./screenshots/C06_AWS_userName.png]]   C06_AWS_grantPermission
   - If creating a new user, add the user as an Administrator. This policy can be more fine-tuned as necessary:
    ![[./screenshots/C07_AWS_grantPermission.png]]   
   - Click "create user"
    ![[./screenshots/C08_AWS_clickCreateAWSUser.png]] 
   - Click on the `Security credentials` tab.
    ![[./screenshots/C09_AWS_clickSecurityCredentials.png]]  
   - Click on `Create access key`.
    ![[./screenshots/C10_AWS_clickCreateAccessKey.png]]  
   - Select "Application Running on an AWS Compute Service" and Confirm that you understand the risks. Then click "Next"
    ![[./screenshots/C11_AWS_accessKeyCreation.png]]  
   - Write a description, if desired
    ![[./screenshots/C12_AWS_accessKeyDescription.png]]  
   - Copy the `Access key ID` and `Secret access key`. You will need them for the next step.
    ![[./screenshots/C13_AWS_accessKeyCopy.png]]  

#### Store AWS Credentials in Jenkins

1. **Log in to Jenkins**:

   - Navigate to your Jenkins instance; same as before. 

2. **Add the AWS Credentials to Jenkins**:

   - Go to `Manage Jenkins` > `Manage Credentials`. (See above for directions/screenshots)
   - Select a domain (e.g., `Global`). (See above for directions/screenshots)
   - Click on `Add Credentials`.
    ![[./screenshots/C14_AWS_clickAddCredentials.png]]  
   - Select `AWS Credentials` as the kind.
    ![[./screenshots/C15_AWS_selectAddCredentials.png]]  
   - Enter the `Access key ID` and `Secret access key`, give it an ID `aws-credentials`, click `OK`.
    ![[./screenshots/C16_AWS_enterAddCredentials.png]] 
   - A successful addition will look like this:
    ![[./screenshots/C17_AWS_addedCredentials.png]] 
   
3. **Using AWS Credentials**

    We have entered these credentials to use them within our Jenkisfile, example below:

```groovy
withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {
    // Your AWS related code here
}
```

### 3. Grafana Admin Credentials

#### Set Up Grafana Admin Credentials

1. **Log in to Grafana**:

   - Navigate to your Grafana instance, on localhost:8080. If this is your first time or you are not logged in, you will see the following screen:
   ![[./screenshots/D00_Grafana_landingScreen.png]] 

2. **Get Admin Credentials**:

   - Use the default admin credentials (`admin` / `admin`) or the ones you have set during Grafana setup. You will immediately be prompted to change password.
    ![[./screenshots/D01_Grafana_newPassword.png]] 
   - Change the password if you are using the default credentials for the first time.
   - You will land at the Grafana homepage.
    ![[./screenshots/D02_Grafana_homePage.png]]  

#### Store Grafana Admin Credentials in Jenkins

1. **Log in to Jenkins**:

   - Navigate to your Jenkins instance. No change from above.

2. **Add the Grafana Admin Credentials to Jenkins**:

   - Go to `Manage Jenkins` > `Manage Credentials`. (See above for directions/screenshots)
   - Select a domain (e.g., `Global`). (See above for directions/screenshots)
   - Click on `Add Credentials`. (See above for directions/screenshots)
   - Select `Username with password` as the kind.
   - Enter `admin` (or your admin username) in the `Username` field.
   - Enter the admin password in the `Password` field.
   - Give it an ID `grafana-admin-pass`.
   - Click `OK`.
    ![[./screenshots/D03_Grafana_addToJenkins.png]] 
   - Success will look like this: 
    ![[./screenshots/D04_Grafana_credentialSuccess.png]] 

3. Using Grafana Admin Credentials

- We did this to use Grafana via Jenkins, as shown below:

```groovy
stage('Generate Grafana API Key') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'grafana-admin-pass', usernameVariable: 'GRAFANA_ADMIN_USER', passwordVariable: 'GRAFANA_ADMIN_PASS')]) {
            sh """
                apt-get update && apt-get install -y jq
                curl -s -X POST ${GRAFANA_URL}/api/auth/keys \
                -u $GRAFANA_ADMIN_USER:$GRAFANA_ADMIN_PASS \
                -H "Content-Type: application/json" \
                -d '{"name":"jenkins-api-key","role":"Admin"}' | jq -r '.key' > grafana_api_key.txt
            """
            script {
                env.GRAFANA_API_KEY = readFile('grafana_api_key.txt').trim()
                if (!env.GRAFANA_API_KEY) {
                    error 'Failed to generate Grafana API Key.'
                }
            }
        }
    }
}
```

### 4. Generate SonarQube Token:

- To integrate SonarQube with Jenkins, you'll need an authentication token. Here's how to generate it:

  - **Log in to SonarQube**:

    - Open your SonarQube instance in your browser. (Go to localhost:9000)
    - You will be greeted by the welcome screen:
    ![[./screenshots/E00SonarqubeLogin.png]] 
    - Log in with your user credentials. If this is your first time logging in, the Login is "admin" and the password is "admin". In this case, you will need to make a new password:
    ![[./screenshots/E01_Sonarqube_newPassword.png]] 

  - **Generate a Token**:

    - Click on your user avatar in the upper-right corner.
    ![[./screenshots/E02_Sonarqube_landingScreen.png]] 
    - Select `My Account`.
    ![[./screenshots/E03_Sonarqube_clickMyAccount.png]] 
    - Navigate to the `Security` tab.
    ![[./screenshots/E04_Sonarqube_clickSecurityTab.png]] 
    - In the `Tokens` section, enter a name for the token (e.g., `jenkins-token`) and select "USer Token" for type, then click `Generate`.
    ![[./screenshots/E05_Sonarqube_generateToken.png]] 
    - Copy the generated token. You will not be able to see this token again, so store it securely.
    ![[./screenshots/E06_Sonarqube_copyToken.png]] 

- **Store the SonarQube Token in Jenkins Credentials**:

  - **Log in to Jenkins**:
    - Open your Jenkins instance in your browser. (See above for directions/screenshots)
    - Log in with your admin credentials. (See above for directions/screenshots)
  - **Add the Token to Jenkins Credentials**:
    - Go to `Manage Jenkins` > `Manage Credentials`. (See above for directions/screenshots)
    - Select a domain (e.g., `Global`).
    - Click on `Add Credentials`.
    - Select `Secret text` as the kind.
    - Paste the SonarQube token in the `Secret` field.
    - Give it an ID `sonarqube-token`.
    ![[./screenshots/E07_Sonarqube_createCredential.png]]
    - Click `Create`. Sucess will look like this:
    ![[./screenshots/E07_Sonarqube_createCredential_success.png]]

### 5. AWS Related info for Jenkins

#### Jenkins file setup




## Step 4: Configure Jenkins Pipeline

1. **Create Jenkins Pipeline**

   - Create a `Jenkinsfile` in the root of the forked repository:
   - Set the following environmental variables based on the data above.

```groovy
   pipeline {  
    agent any  
  
    environment {  
        PROJECT_NAME = 'devops-finalproject-akash'  
        DOCKER_NETWORK = "${PROJECT_NAME}_dev-network"  
        JENKINS_URL = '10.120.64.242:8080'  
        ZAP_CONTAINER_NAME = 'owasp-zap'  
        ZAP_URL = 'http://192.168.1.6:8081'  
        SONARQUBE_URL = 'http://192.168.1.3:9000'  
        SONARQUBE_LOGIN = 'squ_e1e70d0009e9f60a767cca521528ef557b1b0543'  
        DEPLOYMENT_URL = 'http://192.168.1.2:8082'  
        SSH_USER = 'ubuntu'  
        AWS_REGION = 'us-east-1'  
        AMI_ID = 'ami-039a6f82dd07a541e'  
        INSTANCE_TYPE = 't2.micro'  
        KEY_NAME = 'petclinic_key_pair'  
        SECURITY_GROUP_ID = 'sg-0fba393f98de9bcbe'  
        SUBNET_ID ='subnet-0d2f18bee0a9a0ca1'  
        LOCAL_SSH_KEY_PATH = '/root/.ssh/petclinic_key_pair.pem'  
        JAR_FILE = '/target/spring-petclinic-3.3.0-SNAPSHOT.jar'  
        GITHUB_REPO = "akashcha/spring-petclinic"  
        WEBHOOK_URL = "http://${JENKINS_URL}/github-webhook/"  
        GITHUB_TOKEN = credentials('github-token')  
        PROMETHEUS_URL = 'http://192.168.1.4:9090'  
        GRAFANA_URL = 'http://192.168.1.5:3000'  
    }  
  
    triggers {  
        pollSCM('* * * * *')  
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
                        sh 'mvn test'  
                    } catch (Exception e) {  
                        echo "Error during testing: ${e}"  
                        currentBuild.result = 'FAILURE'  
                    }  
                 }  
             }  
         }  
  
  
        stage('Create GitHub Webhook') {  
            steps {  
                script {  
                    def payload = """  
                    {                      "name": "web",                      "active": true,                      "events": ["push", "pull_request"],                      "config": {                        "url": "${WEBHOOK_URL}",  
                        "content_type": "json",                        "insecure_ssl": "0"                      }                    }                    """                    sh """  
                    curl -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Content-Type: application/json" \  
                    -d '${payload}' "https://api.github.com/repos/${GITHUB_REPO}/hooks"  
                    """                }  
            }  
        }  
  
  
  
        stage('Static Analysis') {  
            steps {  
                echo 'Starting static analysis...'  
                script {  
                    try {  
                        sh 'mvn clean verify'  
                                sh """  
                                    docker run --rm \                            --platform linux/amd64 \                                    --network ${env.DOCKER_NETWORK} \                                    -v \$(pwd):/usr/src \  
                                    -w /usr/src \                                    sonarsource/sonar-scanner-cli \                                    sonar-scanner \                                    -Dsonar.projectKey=spring-petclinic \                                    -Dsonar.sources=. \                                    -Dsonar.java.binaries=target/classes \                                    -Dsonar.host.url=${env.SONARQUBE_URL} \                                    -Dsonar.login=${env.SONARQUBE_LOGIN}  
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
                        sleep 10  
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
                        sleep(5)  
                    }  
                }  
  
                if (!serviceAccessible) {  
                    error("Service not accessible at http://192.168.1.2:8082")  
                }  
  
                echo "ZAP_CONTAINER_NAME: ${env.ZAP_CONTAINER_NAME}"  
                echo "DEPLOYMENT_URL: ${env.DEPLOYMENT_URL}"  
  
                sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} mkdir -p /zap/wrk"                sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} zap-baseline.py -t ${env.DEPLOYMENT_URL} -r zap-report.html -I"                    } catch (Exception e) {  
                        echo "Error during preparing ZAP Analysis Script: ${e}"  
                        currentBuild.result = 'FAILURE'  
                    }  
                try {  
                    sh "docker cp ${env.ZAP_CONTAINER_NAME}:/zap/wrk/zap-report.html ${env.WORKSPACE}/zap-report.html"  
                } catch (Exception e) {  
                    echo "Error during copying ZAP report: ${e}"  
                    currentBuild.result = 'FAILURE'  
                }  
                }  
            }  
        }  
  
  
  
        stage('Verify AWS account, open necessary ports 443 and 8080 and look for existing EC2 instances') {  
            steps {  
                withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {  
                    script {  
                        try {  
                            sh 'aws sts get-caller-identity'  
                        } catch (Exception e) {  
                            echo "Error verifying AWS account: ${e}"  
                            currentBuild.result = 'FAILURE'  
                        }  
                    try {  
                            def port443Exists = sh(script: """  
                                aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --query 'SecurityGroups[*].IpPermissions[?FromPort==`443` && ToPort==`443` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text                            """, returnStdout: true).trim()  
  
                            def port8080Exists = sh(script: """  
                                aws ec2 describe-security-groups --group-ids ${SECURITY_GROUP_ID} --query 'SecurityGroups[*].IpPermissions[?FromPort==`8080` && ToPort==`8080` && IpProtocol==`tcp` && IpRanges[?CidrIp==`0.0.0.0/0`]]' --output text                            """, returnStdout: true).trim()  
  
                            if (!port443Exists) {  
                                sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 443 --cidr 0.0.0.0/0"                            } else {  
                                echo "Port 443 rule already exists"  
                            }  
  
                            if (!port8080Exists) {  
                                sh "aws ec2 authorize-security-group-ingress --group-id ${SECURITY_GROUP_ID} --protocol tcp --port 8080 --cidr 0.0.0.0/0"                            } else {  
                                echo "Port 8080 rule already exists"  
                            }  
                    } catch (Exception e) {  
                    echo "Error opening ports 443, and 8080: ${e.getMessage()}"  
                    currentBuild.result = 'FAILURE'  
                    throw e  
                    }  
  
                    try {  
                        def existingInstances = sh(script: """  
                            aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId,PublicIpAddress]" --output text                        """, returnStdout: true).trim()  
  
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
  
  
  
        stage('Create EC2 Instance if none exist') {  
            when {  
        expression { !env.INSTANCE_ID || env.INSTANCE_ID.trim() == "" }  
            }  
            steps {  
                withAWS(credentials: 'aws-credentials') {  
                    script {  
                        try {  
                            env.INSTANCE_ID = sh(script: """  
                                aws ec2 run-instances --image-id ${AMI_ID} --count 1 --instance-type ${INSTANCE_TYPE} --key-name ${KEY_NAME} --security-group-ids ${SECURITY_GROUP_ID} --subnet-id ${SUBNET_ID} --region ${AWS_REGION} --query 'Instances[0].InstanceId' --output text                            """, returnStdout: true).trim()  
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
  
  
        stage('Wait for EC2 Instance to be Running') {  
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
                                echo "Waiting ${waitTime} seconds before retrying..."                                sleep(waitTime)  
                            }  
                        }  
  
                try {  
                        env.INSTANCE_IP = sh(script: """  
                                aws ec2 describe-instances --instance-ids ${env.INSTANCE_ID} --region ${AWS_REGION} --query 'Reservations[0].Instances[0].PublicIpAddress' --output text                        """, returnStdout: true).trim()  
  
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
  
  
        stage('Update Inventory') {  
            steps {  
                script {  
                    sh 'chmod 600 ${LOCAL_SSH_KEY_PATH}'  
                    sh 'cp /opt/ansible/deploy-petclinic.yml ${WORKSPACE}/deploy-petclinic.yml'  
                    try {  
                    writeFile file: 'inventory.ini', text: """  
                            [new_ec2]                            ${env.INSTANCE_IP} ansible_ssh_user=${SSH_USER} ansible_ssh_private_key_file=${LOCAL_SSH_KEY_PATH}  
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
                                [defaults]                                host_key_checking = False                            """  
                            def keyExists = sh(script: """  
                                ssh -o StrictHostKeyChecking=no -o BatchMode=yes -o ConnectTimeout=5 -i ${LOCAL_SSH_KEY_PATH} ${SSH_USER}@${env.INSTANCE_IP} "echo 'Key exists'"                            """, returnStatus: true) == 0  
  
                            if (keyExists) {  
                                echo "SSH key already exists in AWS."  
                            } else {  
                                echo "Deleting existing key from AWS if it exists."  
                                sh """  
                                    aws ec2 delete-key-pair --key-name ${KEY_NAME} --region ${AWS_REGION} || true                                """  
                                echo "Importing SSH key to AWS."  
                                sh """  
                                    aws ec2 import-key-pair --key-name ${KEY_NAME} --public-key-material fileb://${LOCAL_SSH_KEY_PATH}.pub --region ${AWS_REGION}  
                                """  
                            }  
  
                    sh """  
                        ansible-playbook -i inventory.ini ${WORKSPACE}/deploy-petclinic.yml \  
                        -e ami_id=${AMI_ID} \                        -e instance_type=${INSTANCE_TYPE} \                        -e key_name=${KEY_NAME} \                        -e security_group_id=${SECURITY_GROUP_ID} \                        -e subnet_id=${SUBNET_ID} \                        -e region=${AWS_REGION} \                        -e jar_file=${WORKSPACE}/${JAR_FILE} \                        -e ssh_key_path=${LOCAL_SSH_KEY_PATH} \                        -e instance_id=${env.INSTANCE_ID} \                        -e instance_ip=${env.INSTANCE_IP}  
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
  
        stage('Import Grafana Dashboard') {  
  
            steps {  
                    withCredentials([usernamePassword(credentialsId: 'grafana-admin-pass', usernameVariable: 'GRAFANA_ADMIN_USER', passwordVariable: 'GRAFANA_ADMIN_PASS')]) {  
                        sh """  
                            apt-get update && apt-get install -y jq                            curl -s -X POST ${GRAFANA_URL}/api/auth/keys \  
                            -u $GRAFANA_ADMIN_USER:$GRAFANA_ADMIN_PASS \                            -H "Content-Type: application/json" \                            -d '{"name":"jenkins-api-key","role":"Admin"}' | jq -r '.key' > grafana_api_key.txt                        """                        script {  
                            env.GRAFANA_API_KEY = readFile('grafana_api_key.txt').trim()  
                            if (!env.GRAFANA_API_KEY) {  
                            error 'Failed to generate Grafana API Key.'  
                        }  
                    }  
                    }  
                script {  
                    try {  
                        echo 'Importing Grafana dashboard...'  
                        def dashboard = readFile('/opt/grafana/dashboards/dashboard.json')  
                        sh """  
                            curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer ${GRAFANA_API_KEY}" -d '${dashboard}' ${GRAFANA_URL}/api/dashboards/db  
                        """                        echo 'Grafana dashboard imported successfully.'  
                    } catch (Exception e) {  
                        echo "Error importing Grafana dashboard: ${e}"  
                        currentBuild.result = 'FAILURE'  
                    }  
                }  
            }  
        }  
  
  
        stage('Verify Prometheus and Grafana') {  
            steps {  
                script {  
                    try {  
                        echo 'Verifying Prometheus and Grafana...'  
  
                        // Check if Prometheus is running and scraping Jenkins metrics  
                        def prometheusStatus = sh(script: "curl -s ${PROMETHEUS_URL}/api/v1/targets | jq -r .data.activeTargets[].health", returnStdout: true).trim()  
                        echo "Prometheus targets health: ${prometheusStatus}"  
                        if (prometheusStatus.contains('"down"')) {  
                            error "Prometheus is not scraping targets correctly."  
                        }  
  
                        // Check if Grafana is up and can serve the dashboard  
                        def grafanaStatus = sh(script: "curl -s -o /dev/null -w '%{http_code}' ${GRAFANA_URL}/api/health", returnStdout: true).trim()  
                        echo "Grafana status: ${grafanaStatus}"  
                        if (grafanaStatus != '200') {  
                            error "Grafana is not running correctly."  
                        }  
  
                        echo 'Prometheus and Grafana verified successfully.'  
                    } catch (Exception e) {  
                        echo "Error verifying Prometheus and Grafana: ${e}"  
                        currentBuild.result = 'FAILURE'  
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

## Step 5: Configure Prometheus and Grafana

1. **Prometheus Configuration**

   - Update the `prometheus.yml` file to scrape metrics from Jenkins:

```yaml
   global:scrape_interval: 15s   scrape_configs:     - job_name: 'jenkins'       static_configs:         - targets: ['jenkins:8080']  
```

2. **Grafana Configuration**

   - Log in to Grafana and create dashboards to visualize Jenkins metrics.



## Step 6: Configure Ansible for Deployment

1. **Create Ansible Inventory File**

   - Create an `inventory.ini` file for Ansible:

```ini
   [new_ec2]3.14.144.37 ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/key/petclinic_key_pair.pem  ```  

2. **Create Ansible Playbook**  
  
   - Create an `ansible/deploy-petclinic.yml` file:  
  
```yaml  
   ---   - name: Deploy Spring PetClinic Application     hosts: new_ec2     become: yes     vars:       jar_file: "/home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar"     tasks:       - name: Update the package list         apt:           update_cache: yes  
       - name: Install OpenJDK 17         apt:           name: openjdk-17-jdk           state: present  
       - name: Copy the Spring PetClinic JAR file to the EC2 instance         copy:           src: "{{ jar_file }}"           dest: /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar           mode: '0755'           owner: ubuntu           group: ubuntu  
       - name: Run the Spring PetClinic application         shell: "nohup java -jar /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar > /home/ubuntu/petclinic.log 2>&1 &"         args:           chdir: /home/ubuntu         register: run_result  
       - name: Debug - Check if the application is running         shell: "ps aux | grep spring-petclinic-3.3.0-SNAPSHOT.jar"         register: ps_result  
       - debug:           msg: "Run Result: {{ run_result }}"  
       - debug:           msg: "Process Status: {{ ps_result }}"  
   - name: Create and Configure EC2 Instance     hosts: localhost     tasks:       - name: Create a new EC2 instance         command: >           aws ec2 run-instances           --image-id {{ ami_id }}           --count 1           --instance-type {{ instance_type }}           --key-name {{ key_name }}           --security-group-ids {{ security_group_id }}           --subnet-id {{ subnet_id }}           --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-ec2-instance}]'           --region {{ region }}           --query 'Instances[0].InstanceId'           --output text         register: ec2_instance  
       - name: Wait for the EC2 instance to be running         command: >           aws ec2 wait instance-running           --instance-ids {{ ec2_instance.stdout }}           --region {{ region }}  
       - name: Get the public IP of the new EC2 instance         command: >           aws ec2 describe-instances           --instance-ids {{ ec2_instance.stdout }}           --region {{ region }}           --query 'Reservations[0].Instances[0].PublicIpAddress'           --output text         register: ec2_ip  
       - name: Update the Ansible inventory with the new EC2 instance         lineinfile:           path: ./inventory.ini           regexp: '^new_ec2'           line: "new_ec2 ansible_host={{ ec2_ip.stdout }} ansible_user=ubuntu ansible_ssh_private_key_file={{ ssh_key_path }}"         delegate_to: localhost  
  
```

## Step 8: Run Ansible Playbook

1. **Execute the Playbook from Jenkins**

   - Add the following stages to the `Jenkinsfile` to run the Ansible playbook:

```groovy
  
           stage('Copy Ansible Playbook') {               steps {                   script {                       sh 'cp /opt/ansible/deploy-petclinic.yml ${WORKSPACE}/deploy-petclinic.yml'                   }               }           }  
           stage('Update Inventory') {               steps {                   script {                       try {                       writeFile file: 'inventory.ini', text: """                               [new_ec2]                               ${env.INSTANCE_IP} ansible_ssh_user=${SSH_USER} ansible_ssh_private_key_file=${LOCAL_SSH_KEY_PATH}                       """                       } catch (Exception e) {                           echo "Error updating inventory: ${e.getMessage()}"                           currentBuild.result = 'FAILURE'                           throw e                       }                   }               }           }  
           stage('Deploy to EC2 using Ansible') {               steps {                   withAWS(credentials: 'aws-credentials') {                   script {                       try {                               writeFile file: 'ansible.cfg', text: """                                   [defaults]                                   host_key_checking = False                               """  
                               def keyExists = sh(script: """                                   ssh -o StrictHostKeyChecking=no -o BatchMode=yes -o ConnectTimeout=5 -i ${LOCAL_SSH_KEY_PATH} ${SSH_USER}@${env.INSTANCE_IP} "echo 'Key exists'"                               """, returnStatus: true) == 0  
                               if (keyExists) {                                   echo "SSH key already exists in AWS."                               } else {                                   echo "Deleting existing key from AWS if it exists."                                   sh """                                       aws ec2 delete-key-pair --key-name ${KEY_NAME} --region ${AWS_REGION} || true                                   """  
                                   echo "Importing SSH key to AWS."                                   sh """                                       aws ec2 import-key-pair --key-name ${KEY_NAME} --public-key-material fileb://${LOCAL_SSH_KEY_PATH}.pub --region ${AWS_REGION}                                   """                               }  
                               // Run the Ansible playbook with necessary variables                       sh """                           ansible-playbook -i inventory.ini ${WORKSPACE}/deploy-petclinic.yml \                           -e ami_id=${AMI_ID} \                           -e instance_type=${INSTANCE_TYPE} \                           -e key_name=${KEY_NAME} \                           -e security_group_id=${SECURITY_GROUP_ID} \                           -e subnet_id=${SUBNET_ID} \                           -e region=${AWS_REGION} \                           -e jar_file=${WORKSPACE}/${JAR_FILE} \                           -e ssh_key_path=${LOCAL_SSH_KEY_PATH}                       """                       } catch (Exception e) {                           echo "Error deploying to EC2 using Ansible: ${e.getMessage()}"                           currentBuild.result = 'FAILURE'                           throw e                       }                       }                   }               }           }  
  
```

## Step 9: Verify the Setup

1. **Verify Application Deployment**

   - Ensure the spring-petclinic application is running on the EC2 instance and accessible at `http://ec2-public-dns:8082`.
2. **Test Automated Build and Deployment**

   - Make and push a code change to the GitHub repository.
   - Verify Jenkins automatically builds, tests, and deploys the new version, and the content change is reflected in the deployed application.

# Issues
