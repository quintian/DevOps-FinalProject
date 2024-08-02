# ==Tooling==:

## Host OS: macOS

1. OS Host Details:
    1. OS Name: macOS Sonoma Version 14.5
    2. Build version: 23F79
    3. Chipset: Apple M1 Pro
2. Screenshot :  
   ![image](./screenshots/macversion_1.png)


## Also Tested on: Windows 11 Education Edition
    1. OS Host Details:        Processor   Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz   2.59 GHz        Installed RAM   16.0 GB (15.8 GB usable)        Product ID  00328-00805-52422-AA517        System type 64-bit operating system, x64-based processor  
    2. Windows Details:        Windows 11 Education Edition        3. All Linux was through WSL2, (i.e., Through Docker Desktop using WSL installation.):  
        WSL version: 2.2.4.0        Kernel version: 5.15.153.1-2        WSLg version: 1.0.61        MSRDC version: 1.2.5326        Direct3D version: 1.611.1-81528511        DXCore version: 10.0.26091.1-240325-1447.ge-release        Windows version: 10.0.22631.3880  


## Softwares used
Here's a breakdown of the software, third-party libraries, and commands used in the provided code along with how to find their versions:

### 1. **Jenkins**
**Docker Image**: `jenkins/jenkins:lts`
- **Version Check**:
  ```sh
  docker run jenkins/jenkins:lts --version
  ```
- **Version**: 2.452.3
- Jenkin's Underlying OS release:
  -# docker exec -it sonarqube cat /etc/os-release
  PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
  NAME="Debian GNU/Linux"
  VERSION_ID="12"
  VERSION="12 (bookworm)"
  VERSION_CODENAME=bookworm
  ID=debian
  HOME_URL="https://www.debian.org/"
  SUPPORT_URL="https://www.debian.org/support"
  BUG_REPORT_URL="https://bugs.debian.org/"
### 2. **Maven**
**Commands**:
```sh
apt-get install -y maven
```
- **Version Check**:
  ```sh
  mvn -v
  ```
- **Version**: Apache Maven 3.8.7

### 3. **Docker**
**Commands**:
- **Version Check**:
  ```sh
  docker --version
  docker compose version
  ```
**docker version**: Docker version 27.0.3, build 7d4bcd8
**docker compose version**: Docker Compose version v2.28.1-desktop.1

### 4. **Prometheus**
**Docker Image**: `prom/prometheus:latest`
- **Version Check**: docker run prom/prometheus:latest --version
- **Version**: prometheus, version 2.53.1 (branch: HEAD, revision: 14cfec3f6048b735e08c1e9c64c8d4211d32bab4)
  build user:       root@9f8e5b6970da
  build date:       20240710-10:18:44
  go version:       go1.22.5
  platform:         linux/arm64
  tags:             netgo,builtinassets,stringlabels
    - OS ==Version==: Linux ed68bcdd096b 6.6.32-linuxkit #1 SMP Thu Jun 13 14:13:01 UTC 2024 aarch64 GNU/Linux
    - command used:  /prometheus $ uname -a
### 5. **Grafana**
**Docker Image**: `docker run grafana/grafana:latest --version`
- **Version Check**: Check the version via the web interface at `http://localhost:3000`.
- **Configuration File**: `grafana.ini`, `datasources.yml`, `dashboards.yml`
- Version : Version 11.1.0 (commit: 5b85c4c2fcf5d32d4f68aaef345c53096359b2f1, branch: HEAD)
- OS Version: NAME="Alpine Linux"
  ID=alpine
  VERSION_ID=3.19.1
  PRETTY_NAME="Alpine Linux v3.19"
  HOME_URL="https://alpinelinux.org/"
  BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"

### 6. **SonarQube**
**Docker Image**: `sonarqube:latest`
- **Version Check**: curl http://localhost:9000/api/server/version
- Version: 10.6.0.92116
- Under lying OS:
    - Command: docker exec -it sonarqube cat /etc/os-release
    - Version:
      PRETTY_NAME="Ubuntu 22.04.4 LTS"
      NAME="Ubuntu"
      VERSION_ID="22.04"
      VERSION="22.04.4 LTS (Jammy Jellyfish)"
      VERSION_CODENAME=jammy
      ID=ubuntu
      ID_LIKE=debian
      HOME_URL="https://www.ubuntu.com/"
      SUPPORT_URL="https://help.ubuntu.com/"
      BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
      PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
      UBUNTU_CODENAME=jammy


### 7. **OWASP ZAP**
**Docker Image**: `zaproxy/zap-weekly`
- **Version Check**: Check the version via the web interface at `http://<zap-server-ip>:8081`.
- **Version**: ZAP D-2024-07-22
- OS Version : PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
  NAME="Debian GNU/Linux"
  VERSION_ID="11"
  VERSION="11 (bullseye)"
  VERSION_CODENAME=bullseye
  ID=debian
  HOME_URL="https://www.debian.org/"
  SUPPORT_URL="https://www.debian.org/support"
  BUG_REPORT_URL="https://bugs.debian.org/"

![[zap_version.png]]
### 8. **PostgreSQL**
**Docker Image**: `postgres:13`
- **Version Check**:
  ```sh
  docker run postgres:13 --version
  ```
Version: postgres (PostgreSQL) 13.15 (Debian 13.15-1.pgdg120+1)
OS Version: Linux 5f89576cd8e0 6.6.32-linuxkit #1 SMP Thu Jun 13 14:13:01 UTC 2024 aarch64 GNU/Linux

### 9. **Ansible**
**Commands**:
```sh
sudo apt-get install ansible -y
```
- **Version Check**:
  ```sh
  ansible --version
  ```
- Version : ansible [core 2.14.3]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.11.2 (main, May  2 2024, 11:59:08) [GCC 12.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
### 10. **AWS CLI**

**Version Check**:
  ```sh
  aws --version
  ```
Version: aws-cli/2.16.4 Python/3.11.9 Darwin/23.5.0 source/arm64

### 11. **jq**

- **Version Check**:
  ```sh
  jq --version
  ```
- Version : jq-1.6

### 12. **SonarQube Scanner**
**Docker Image**: `sonarsource/sonar-scanner-cli`
- **Version Check**:
  ```sh
  docker run sonarsource/sonar-scanner-cli sonar-scanner --version
  ```
- Version:
  SonarScanner 5.0.1.3006
  Java 17.0.11 Alpine (64-bit)
- OS Version: Linux 6.6.32-linuxkit amd64

### 13. **Jenkins Plugins**

command: java -jar jenkins-cli.jar -s http://localhost:8080/ -auth admin:f49e45f1c8814cc397f6142ab0eed8e9 list-plugins


| Plugin Name                           | Description                                             | Version                         |
|---------------------------------------|---------------------------------------------------------|---------------------------------|
| ansible                               | Ansible plugin                                          | 403.v8d0ca_dcb_b_502            |
| apache-httpcomponents-client-4-api    | Apache HttpComponents Client 4.x API Plugin             | 4.5.14-208.v438351942757        |
| aws-credentials                       | AWS Credentials Plugin                                  | 231.v08a_59f17d742              |
| blueocean                             | Blue Ocean                                              | 1.27.14                         |
| docker-commons                        | Docker Commons Plugin                                   | 439.va_3cb_0a_6a_fb_29          |
| docker-workflow                       | Docker Pipeline                                         | 580.vc0c340686b_54              |
| git                                   | Git plugin                                              | 5.2.2                           |
| github                                | GitHub plugin                                           | 1.39.0                          |
| pipeline-aws                          | Pipeline: AWS Steps                                     | 1.45                            |
| pipeline-model-definition             | Pipeline: Declarative                                    | 2.2205.vc9522a_9d5711           |
| prometheus                            | Prometheus metrics plugin                               | 780.v7c50a_d288424              |
| sonar                                 | SonarQube Scanner for Jenkins                           | 2.17.2                          |
| zap                                   | Official OWASP ZAP Jenkins Plugin                       | 1.1.0                           |


### Additional Tools and Libraries
1. **curl**:
    1. Version: curl 7.88.1 (aarch64-unknown-linux-gnu) libcurl/7.88.1 OpenSSL/3.0.13 zlib/1.2.13 brotli/1.0.9 zstd/1.5.4 libidn2/2.3.3 libpsl/0.21.2 (+libidn2/2.3.3) libssh2/1.10.0 nghttp2/1.52.0 librtmp/2.3 OpenLDAP/2.5.13
       Release-Date: 2023-02-20, security patched: 7.88.1-10+deb12u6
       Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
       Features: alt-svc AsynchDNS brotli GSS-API HSTS HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB PSL SPNEGO SSL threadsafe TLS-SRP UnixSockets zstd
2. **sudo**:
    1. Version: Sudo version 1.9.13p3

### Commands to Check Versions
1. **`jenkins`**: Included in Docker image.
2. **`maven`**: `mvn -v`
3. **`docker`**: `docker --version`
4. **`docker-compose`**: `docker-compose --version`
5. **`prometheus`**: Via web interface.
6. **`grafana`**: Via web interface.
7. **`sonarqube`**: Via web interface.
8. **`zaproxy`**: Via web interface.
9. **`postgres`**: `docker run postgres:13 --version`
10. **`ansible`**: `ansible --version`
11. **`aws-cli`**: `aws --version`
12. **`jq`**: `jq --version`
13. **`sonar-scanner`**: `docker run sonarsource/sonar-scanner-cli sonar-scanner --version`

By following the above instructions, you can identify the versions of the software and libraries used in your setup. This ensures that you have consistent and compatible versions across different environments.


# Steps

**Goal:** Build a DevSecOps pipeline for the spring-petclinic project using Docker, Jenkins, SonarQube, Prometheus, Grafana, OWASP ZAP, and Ansible for deploying the application to an AWS EC2 instance.

To accomplish this assignment, follow these steps:

## Step 1: Installing Docker on Mac

1. **Install Docker on Your Host Machine (Mac)**:

   Referenced:  [link:](https://docs.docker.com/desktop/install/mac-install/#install-and-run-docker-desktop-on-mac)

    1. ==Downloaded the Docker file from [link](https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64&_gl=1*1utz1qt*_ga*MTU0MDU1NDI0MS4xNzA4MDc0NTYw*_ga_XJWPQMJYHQ*MTcxOTE0MTk4OS4xMS4xLjE3MTkxNDE5ODkuNjAuMC4w)==  
       ![image](./screenshots/1_download_docker_file_for_apple_silicon_chip.png)
    2. Download complete  
       ![image](./screenshots/2_download_complete.png)
    3. Copy Docker.app to Applications folder  
       ![./screenshots/3_Copy_Docker.app_to_Applications_folder.png]
    4. Copying to applications folder on my mac in progress  
       ![image](./screenshots/4_Copying_in_progress.png)
    5. Open the copied docker file  
       ![image](./screenshots/5_Open_the_copied_Docker_app.png)
    6. Accept Docker service agreement  
       ![image](./screenshots/6_Accept_the_terms_before_docker_starts.png)
    7. Use recommended settings and Finish  
       ![image](./screenshots/7_Use_recommended_settings_and_finish.png)
    8. Either create an account on docker or sign in using existing account.  
       ![image](./screenshots/8_Either_create_an_account_on_docker_or_sign_in_using_existing_account.png)
    9. Signing in using existing docker account.   
       ![image](./screenshots/9_Signing_in_using_existing_docker_account.png)
    10. Docker is installed and signed-in. Now proceed to the docker desktop app.  
        ![image](./screenshots/11_Docker_is_installed_and_signed-in_proceed.png)
    11. Check if docker is installed by checking the docker version  
        ![image](./screenshots/12_Check_if_docker_is_installed_by_checking_the_docker_version.png)
    12. Run hello-world test just to make sure everything is working fine.  
        ![image](./screenshots/13_Run_hello-world_test_just_to_make_sure_everything_is_work_fine.png)
    13. Check on the docker app if the hello-world container instance ran and exited as expected  
        ![image](./screenshots/14_Check_on_the_docker_app_if_the_hello-world_container_instance_ran_and_exited_as_expected.png)

## Step 2: Configure Docker Containers

### Fork and Clone Repository

- Fork the [spring-petclinic](https://github.com/spring-projects/spring-petclinic) repository on GitHub/GitLab.
- Clone the forked repository to your local machine.


1. 1. Fork the [spring-petclinic](https://github.com/spring-projects/spring-petclinic) repository to your GitHub/GitLab account.

![[01_fork_and_clone.png]]
2. ![[02_fork_and_clone.png]]
3. ![[03_fork_and_clone.png]]
4. Clone the forked repository to your local machine:
   ```bash
   git clone https://github.com/<your-username>/spring-petclinic.git
   cd spring-petclinic
   ```
   **output**:
   sreeakash@KP-QNPHXDYRW1 DevOps-FinalProject-Akash % git clone https://github.com/akashcha/spring-petclinic.git
   Cloning into 'spring-petclinic'...
   remote: Enumerating objects: 9967, done.
   remote: Total 9967 (delta 0), reused 0 (delta 0), pack-reused 9967
   Receiving objects: 100% (9967/9967), 7.55 MiB | 15.43 MiB/s, done.
   Resolving deltas: 100% (3762/3762), done.

   **Screenshot**:
   ![[Pasted image 20240721132801.png]]
### Project Structure

Below is the text representation of the project structure shown in the image:

```  
DevOps-FinalProject
├── ansible
│   ├── deploy-petclinic.yml
│   └── inventory.ini
├── documentation
│   └── placeholder
├── grafana
│   ├── dashboards
│   └── provisioning
│       ├── dashboards
│       │   ├── dashboard.json
│       │   └── dashboards.yml
│       └── datasources
│           └── datasources.yml
├── key
│   ├── petclinic_key_pair.pem
│   └── petclinic_key_pair.pem.pub
├── prometheus
│   └── prometheus.yml
├── screenshots
│   └── images...
├── spring-petclinic
├── docker-compose.yml
├── grafana.ini
├── jenkins_dockerfile
├── Jenkinsfile
├── Readme.md
└── textDump.txt

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
  
# Copy the dashboard.json to a specific location in the Docker image  
COPY grafana/provisioning/dashboards/dashboard.json /opt/grafana/dashboards/dashboard.json  
  
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
    && apt-get install -y sudo \    && apt-get install -y maven \    && rm -rf /var/lib/apt/lists/*  
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
    && sudo apt-get install ca-certificates curl unzip \    && sudo install -m 0755 -d /etc/apt/keyrings \    && sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \    && sudo chmod a+r /etc/apt/keyrings/docker.asc  
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
    unzip awscliv2.zip && \    sudo ./aws/install  
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
    trilead-api:2.147.vb_73cc728a_32e \    docker-workflow \    workflow-aggregator \    sonar \    prometheus \    zap \    git \    pipeline-stage-step \    ansible \    cloudbees-disk-usage-simple \    blueocean \    aws-credentials \    credentials-binding \    pipeline-aws  
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
      - grafana-storage:/var/lib/grafana
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

volumes:
  grafana-storage:

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
      - grafana-storage:/var/lib/grafana
      - ./grafana/provisioning:/etc/grafana/provisioning
    networks:
      dev-network:
        ipv4_address: 192.168.1.5



  volumes:
    grafana-storage:
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

## Step 3: Running Containers and Initial Setup

By following these steps, you can create and store the necessary credentials required in Jenkins pipeline and use them securely in your pipeline. The necessary credentials are:

0) Instantiate the containers
1) Github Token (github-token)
2) AWS Crednentials (aws-credentials )
3) ssh key creation and sharing for AWS
4) AWS related information

In order to have a place to store these credentials, you must instantiate your containers. This is the first time you will run a command.

### 0. Instantiate the containers to configure them.

1. If you don't already have Docker Desktop started, start it.
2. Build he container using the following command:
```sh
docker compose build 
```

![[A00_docker_compose_up_-d.png.png]]


3. Run the following command from the main project directory.
    ```bash  
        docker compose -p devops-finalproject-team4 up -d 
    ```    
   NOTE: The project name should be passed or it will take the project directory name as the default name which might cause issues with the network setup.

   This command instantiates the volumes, networks, and containers required.  
   Screenshot:  
   ![[A01_docker_compose_up_-d.png.png]]

   If this is the first time you have ever built the containers, you will see something like this as they get built:

   As the Jenkins container builds for the first time, you will see something like this:  
   Screenshot:  ![image](./screenshots/A001_docker_compose_up_-d_first_time_jenkins_build.png)
   Ultimately, the starting printouts will look the same:   
   Screenshot: ![image](./screenshots/A002_docker_compose_up_-d_first_time_start.png)
3. You will now need to do administrative setup of Jenkins. First, navigate to localhost:8080 in your browser:  
   Screenshot:  ![image](./screenshots/A02_Jenkins_splashScreen.png)
4. To get the administrative password, go to Docker Desktop, click on Jenkins  
   Screenshot:  ![image](./screenshots/A03_Jenkins_openContainer.png)
5. Now click on "Logs"  
   Screenshot:  ![image](./screenshots/A04_Jenkins_logs.png)
6. And copy the provided password. Alternatively, this will be available in the terminal (after lots of searching) if you run the docker compose up command *without* the -d flag.  
   Screenshot:  ![image](./screenshots/A05_Jenkins_logs_copyPassword.png)
7. Paste this into the Jenkins Password bar:  
   Screenshot:  ![[./screenshots/A05_Jenkins_paste_password.png]]
8. Because our plugins were programmatically installed in the Jenkins container as specified in the Dockerfile during the build process, there is no need to install the suggested plugins, and you can exit out of the landing screen. Click the "x" in the top right hand corner.  
   Screenshot: ![image](./screenshots/A06_Jenkins_bypassLanding.png)
9. Jenkins is now setup. Click "Start using Jenkins"  
   Screenshot: ![image](./screenshots/A07_Jenkins_startUsing.png)


Here are the steps to create and store the `github-token`, `aws-credentials`, and `grafana-admin-pass` credentials in Jenkins:

### 1. GitHub Token

#### Create a GitHub Token for creation of webhooks.

1. **Log in to GitHub**:

    - Go to [GitHub](https://github.com/) and log in to your account.
2. **Generate a New Token**:

    - Click on your profile picture in the top right corner and select `Settings`.  
      ![image](./screenshots/15_githubToken_select_settings.png)
    - In the left sidebar, click on `Developer settings`.  
      ![[./screenshots/16_githubToken_developer_settings.png]]
    - Click on `Personal access tokens`.  
      ![[./screenshots/17_githubToken_fineGrainedTokens.png]]
    - Click on `Generate new token`. We used a fine-grained token.    
      ![image](./screenshots/18_githubToken_generateToken.png)
    - Give your token a descriptive name (e.g., `Jenkins Token`).  
      ![image](./screenshots/19_githubToken_nameToken.png)
    - Select the scopes you need for your project (e.g., `repo` for repository access). Provide access to the forked pet clinic repo.  
      ![image](./screenshots/20_githubToken_scopeToken.png)
    - Click `Repository permissions`  
      ![image](./screenshots/21_githubToken_repoClick.png)
    - Select webhooks under permissions.  
      ![image](./screenshots/22_githubToken_webHooks.png)
    - Click on `Generate token`.  
      ![image](./screenshots/23_githubToken_generateToken.png)
    - Copy the token. You will need it for the next step. (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)  
      ![image](./screenshots/24_githubToken_copyToken.png)

#### Store GitHub Token in Jenkins

1. **Log in to Jenkins**:
    - Navigate to your Jenkins instance by going to localhost:8080  
      ![image](./screenshots/B01_tokenSetup_NavigateToJenkins.png)
2. **Add the Token to Jenkins Credentials**:

    - Go to `Manage Jenkins` > `Manage Credentials`.  
      ![image](./screenshots/B02_tokenSetup_clickManageJenkins.png)
    - Click on `Add Credentials`.  
      ![image](./screenshots/B03_tokenSetup_clickManageCredentials.png)
    - Select a domain (e.g., `Global`).   
      ![image](./screenshots/B04_tokenSetup_clickGlobal.png)
    - Click "adding some credentials"  
      ![image](./screenshots/B05_tokenSteup_addCredentials.png)
    - Select `Secret text` as the kind.  
      ![image](./screenshots/B06_tokenSteup_selectSecretText.png)
    - Paste the GitHub token in the `Secret` field and give it an ID `github-token`, optionally a description, then click 'Create'  
      ![image](./screenshots/B07_tokenSteup_createSecretText.png)

3. Using GitHub Token
    - The reason to do this is to use that token via a reference in the Jenkinsfile, i.e.:

```groovy  
environment {  
    GITHUB_TOKEN = credentials('github-token')}  
```  

### 2. AWS Credentials

#### Create AWS Access Key and Secret Key

1. **Log in to AWS Management Console**:

    - Go to [AWS Management Console](https://aws.amazon.com/console/).  
      ![image](./screenshots/C01_AWS_console.png)
    - Log into your account. You will land on different pages, depending on your region, but Pittsburgh points here:  
      ![image](./screenshots/C02_AWS_landing.png)

2. **Generate Access Keys**:

    - Click on your account name in the top right corner and select `My Security Credentials`.  
      ![image](./screenshots/C03_AWS_selectSecurityCredentials.png)
    - In the left sidebar, click on `Users`.  
      ![image](./screenshots/C04_AWS_selectUsers.png)
    - Select the user you want to create access keys for (or create a new user with programmatic access).  
      ![image](./screenshots/C05_AWS_createNewUser.png)
    - If creating a new user, name them something:  
      ![image](./screenshots/C06_AWS_userName.png)   C06_AWS_grantPermission
    - If creating a new user, add the user as an Administrator. This policy can be more fine-tuned as necessary:  
      ![image](./screenshots/C07_AWS_grantPermission.png)
    - Click "create user"  
      ![image](./screenshots/C08_AWS_clickCreateAWSUser.png)
    - Click on the `Security credentials` tab.  
      ![image](./screenshots/C09_AWS_clickSecurityCredentials.png)
    - Click on `Create access key`.  
      ![image](./screenshots/C10_AWS_clickCreateAccessKey.png)
    - Select "Application Running on an AWS Compute Service" and Confirm that you understand the risks. Then click "Next"  
      ![image](./screenshots/C11_AWS_accessKeyCreation.png)
    - Write a description, if desired  
      ![image](./screenshots/C12_AWS_accessKeyDescription.png)
    - Copy the `Access key ID` and `Secret access key`. You will need them for the next step.  
      ![image](./screenshots/C13_AWS_accessKeyCopy.png)

#### Store AWS Credentials in Jenkins

1. **Log in to Jenkins**:

    - Navigate to your Jenkins instance; same as before.

2. **Add the AWS Credentials to Jenkins**:

    - Go to `Manage Jenkins` > `Manage Credentials`. (See above for directions/screenshots)
    - Select a domain (e.g., `Global`). (See above for directions/screenshots)
    - Click on `Add Credentials`.  
      ![image](./screenshots/C14_AWS_clickAddCredentials.png)
    - Select `AWS Credentials` as the kind.  
      ![[./screenshots/C15_AWS_selectAddCredentials.png]]
    - Enter the `Access key ID` and `Secret access key`, give it an ID `aws-credentials`, click `OK`.  
      ![[./screenshots/C16_AWS_enterAddCredentials.png]]
    - A successful addition will look like this:  
      ![image](./screenshots/C17_AWS_addedCredentials.png)

3. **Using AWS Credentials**

   We have entered these credentials to use them within our Jenkisfile, example below:

```groovy  
withAWS(credentials: 'aws-credentials', region: "${AWS_REGION}") {  
    // Your AWS related code here}  
```  

### 3. Grafana Admin Credentials

#### Set Up Grafana Admin Credentials

1. **Log in to Grafana**:

    - Navigate to your Grafana instance, on localhost:8080. If this is your first time or you are not logged in, you will see the following screen:  
      ![image](./screenshots/D00_Grafana_landingScreen.png)

2. **Get Admin Credentials**:

    - Use the default admin credentials (`admin` / `admin`) or the ones you have set during Grafana setup. You will immediately be prompted to change password.  
      ![image](./screenshots/D01_Grafana_newPassword.png)
    - Change the password if you are using the default credentials for the first time.
    - You will land at the Grafana homepage.  
      ![image](./screenshots/D02_Grafana_homePage.png)


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
      ![image](./screenshots/D03_Grafana_addToJenkins.png)

3. Using Grafana Admin Credentials

- We did this to use Grafana via Jenkins, as shown below:

```groovy  
stage('Generate Grafana API Key') {
    steps {        withCredentials([usernamePassword(credentialsId: 'grafana-admin-pass', usernameVariable: 'GRAFANA_ADMIN_USER', passwordVariable: 'GRAFANA_ADMIN_PASS')]) {            sh """                apt-get update && apt-get install -y jq                curl -s -X POST ${GRAFANA_URL}/api/auth/keys \                -u $GRAFANA_ADMIN_USER:$GRAFANA_ADMIN_PASS \                -H "Content-Type: application/json" \                -d '{"name":"jenkins-api-key","role":"Admin"}' | jq -r '.key' > grafana_api_key.txt            """            script {                env.GRAFANA_API_KEY = readFile('grafana_api_key.txt').trim()                if (!env.GRAFANA_API_KEY) {                    error 'Failed to generate Grafana API Key.'                }            }        }    }}  
```  

### 4. Generate SonarQube Token:

- To integrate SonarQube with Jenkins, you'll need an authentication token. Here's how to generate it:

    - **Log in to SonarQube**:

        - Open your SonarQube instance in your browser.
        - Log in with your user credentials.
    - **Generate a Token**:

        - Click on your user avatar in the upper-right corner.
        - Select `My Account`.
        - Navigate to the `Security` tab.
        - In the `Tokens` section, enter a name for the token (e.g., `jenkins-token`) and click `Generate`.
        - Copy the generated token. You will not be able to see this token again, so store it securely.
- **Store the SonarQube Token in Jenkins Credentials**:

    - **Log in to Jenkins**:
        - Open your Jenkins instance in your browser.
        - Log in with your admin credentials.
    - **Add the Token to Jenkins Credentials**:
        - Go to `Manage Jenkins` > `Manage Credentials`.
        - Select a domain (e.g., `Global`).
        - Click on `Add Credentials`.
        - Select `Secret text` as the kind.
        - Paste the SonarQube token in the `Secret` field.
        - Give it an ID `sonarqube-token`.
        - Click `OK`.

### 5. AWS Related info for Jenkins

#### Jenkins file setup

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

a. Use your own keys: If you use your own keys, copy them in the key folder in the project with the name "petclinic_key_pair.pem" and "petclinic_key_pair.pem.pub".

b. if you decide to use the keys generated AWS for manual setup follow the following steps.  
**Step 1:** From the **EC2 Dashboard**, in the left navigation pane, click **Key Pairs** under **Network & Security**.

**Step 2:** If you already have a key pair, the name will be listed there. For example, `petclinic_key_pair`.

**Step 3:** If you do not have a key pair, click on **Create Key Pair**.

- Enter `petclinic_key_pair` as the key pair name.
- Choose the file format (PEM for Linux/Mac, PPK for Windows).
- Click **Create Key Pair** and download the key file.  
  **Step 4**: Download and Store the Key File
- **Download the Key File:** Save the private key file in a secure location. You will need this file to connect to your EC2 instances.

    - **Linux/MacOS:** The file will be named something like `petclinic_key_pair.pem`.
    - **Windows:** The file will be named something like `petclinic_key_pair.ppk`.
- In our application, you will have to store the private key in the following location on jenkins: /root/.ssh/

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

### 6. Configure Jenkins Pipeline

1. **Create Jenkins Pipeline**

    - Create a `Jenkinsfile` in the root of the forked repository:

```groovy  
   pipeline {
    agent any

    environment {
        PROJECT_NAME = 'devops-finalproject-team4'
        DOCKER_NETWORK = ''
        JENKINS_URL = '10.120.64.242:8080'
        ZAP_CONTAINER_NAME = 'owasp-zap'
        ZAP_URL = 'http://192.168.1.6:8081'
        SONARQUBE_URL = 'http://192.168.1.3:9000'
        GRAFANA_URL = 'http://192.168.1.5:3000'
        GRAFANA_DASHBOARD_URL = 'http://localhost:3000/d/haryan-jenkins/jenkins-performance-and-health-overview?orgId=1'
        SONARQUBE_DASHBOARD_URL = "${SONARQUBE_URL}/dashboard?id=spring-petclinic"
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
        PROMETHEUS_URL = 'http://192.168.1.4:9090'
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Initialize') {
            steps {
                script {
                    // Set the Docker network name based on the project name  
                    DOCKER_NETWORK = "${params.PROJECT_NAME ?: PROJECT_NAME}_dev-network"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    try {
                        sh 'rm -f ${WORKSPACE}/zap-report.html'
                        sh 'find ${WORKSPACE} -name "report-task.txt" -delete'
                        sh 'find ${WORKSPACE} -name "sonarqube-report.html" -delete'
                    } catch (Exception e) {
                        echo "Error during cleanup: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }

        stage('Setup Docker Network') {
            steps {
                script {
                    try {
                        echo "Setting up Docker network: ${DOCKER_NETWORK}"
                        def networkExists = sh(script: "docker network ls --filter name=${DOCKER_NETWORK} -q", returnStdout: true).trim()
                        if (networkExists) {
                            echo "Docker network ${DOCKER_NETWORK} already exists."
                        } else {
                            sh "docker network create ${DOCKER_NETWORK}"
                            echo "Docker network ${DOCKER_NETWORK} created."
                        }
                    } catch (Exception e) {
                        echo "Error setting up Docker network: ${e}"
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
                    withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                        def payload = """  
                    {  
                      "name": "web",  
                      "active": true,  
                      "events": ["push", "pull_request"],  
                      "config": {  
                        "url": "${WEBHOOK_URL}",  
                        "content_type": "json",  
                        "insecure_ssl": "0"  
                      }  
                    }  
                    """
                        sh """#!/bin/bash  
                        curl -X POST -H "Authorization: token $GITHUB_TOKEN" -H "Content-Type: application/json" \  
                        -d '$payload' "https://api.github.com/repos/${GITHUB_REPO}/hooks"  
                    """                }
                }
            }
        }

        stage('Run Test Instance') {
            steps {
                script {
                    try{
                        sh 'nohup mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &'
                        sleep 10
                    } catch (Exception e) {
                        echo "Error during Static Analysis: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
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

                        sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} mkdir -p /zap/wrk"
                        sh "docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} zap-baseline.py -t ${env.DEPLOYMENT_URL} -r zap-report.html -I"
                    } catch (Exception e) {
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

        stage('Static Analysis') {
            steps {
                script {
                    try{
                        def sonarScannerImage = docker.image('sonarsource/sonar-scanner-cli')
                        sonarScannerImage.pull()

                        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONARQUBE_TOKEN')]) {
                            sonarScannerImage.inside("--network=${DOCKER_NETWORK}") {
                                sh """  
                            apt-get update && apt-get install -y curl  
                            sonar-scanner -e \  
                                -Dsonar.host.url=${SONARQUBE_URL} \  
                                -Dsonar.token=${SONARQUBE_TOKEN} \  
                                    -Dsonar.projectKey=spring-petclinic \  
                                    -Dsonar.sources=. \  
                                    -Dsonar.exclusions=**/excluded-directory/**,**/*.tmp,**/regex-pattern-*.log \  
                                -Dsonar.java.binaries=target/classes  
                                """
                                sh "cp .scannerwork/report-task.txt ${WORKSPACE}/report-task.txt"
                            }
                        }
                    } catch (Exception e) {
                        echo "Error during Static Analysis: ${e}"
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



        stage('Create EC2 Instance if none exist') {
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


        stage('Update Inventory') {
            steps {
                script {
                    sh 'chmod 600 ${LOCAL_SSH_KEY_PATH}'
                    sh 'cp /opt/ansible/deploy-petclinic.yml ${WORKSPACE}/deploy-petclinic.yml'
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

                            sh """  
                        ansible-playbook -i inventory.ini ${WORKSPACE}/deploy-petclinic.yml \  
                        -e ami_id=${AMI_ID} \  
                        -e instance_type=${INSTANCE_TYPE} \  
                        -e key_name=${KEY_NAME} \  
                        -e security_group_id=${SECURITY_GROUP_ID} \  
                        -e subnet_id=${SUBNET_ID} \  
                        -e region=${AWS_REGION} \  
                        -e jar_file=${WORKSPACE}/${JAR_FILE} \  
                        -e ssh_key_path=${LOCAL_SSH_KEY_PATH} \  
                        -e instance_id=${env.INSTANCE_ID} \  
                        -e instance_ip=${env.INSTANCE_IP}  
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

        stage('Publish Reports') {
            steps {
                script {
                    publishHTML(target: [
                            reportName: 'ZAP Report',
                            reportDir: '.',
                            reportFiles: 'zap-report.html',
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            allowMissing: true
                    ])
                }
                script {
                    writeFile file: 'sonarqube-report.html', text: """  
                    <html>  
                            <head>  
                            <meta http-equiv="refresh" content="0; url=${SONARQUBE_DASHBOARD_URL}" />  
                            </head>  
                    <body>  
                            <p>If you are not redirected automatically, follow the <a href="${SONARQUBE_DASHBOARD_URL}">SonarQube Dashboard</a>.</p>  
                    </body>  
                    </html>  
                    """
                    publishHTML(target: [
                            reportName: 'SonarQube Report',
                            reportDir: '.',
                            reportFiles: 'sonarqube-report.html',
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            allowMissing: true
                    ])
                }
                script {
                    writeFile file: 'grafana-report.html', text: """  
            <html>  
                <head>  
                    <meta http-equiv="refresh" content="0; url=${GRAFANA_DASHBOARD_URL}" />  
                </head>  
                <body>  
                    <p>If you are not redirected automatically, follow the <a href="${GRAFANA_DASHBOARD_URL}">Grafana Dashboard</a>.</p>  
                </body>  
            </html>  
            """
                    publishHTML(target: [
                            reportName: 'Grafana Report',
                            reportDir: '.',
                            reportFiles: 'grafana-report.html',
                            alwaysLinkToLastBuild: true,
                            keepAll: true,
                            allowMissing: true
                    ])
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

## Step 5: Configure Prometheus and Grafana

### **Prometheus Configuration**

- Update the `prometheus.yml` file to scrape metrics from Jenkins:

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

Explanation:

This Prometheus configuration file sets up the global scrape interval and defines specific scrape jobs to collect metrics from Jenkins and Prometheus instances. Here’s a detailed explanation of each section:

- Global Configuration
```yaml
global:
  scrape_interval: 15s
```
- **scrape_interval: 15s**: This sets the default time interval between each scrape of targets (i.e., how frequently Prometheus will collect metrics) to 15 seconds.

- Scrape Configurations
  This section defines the individual jobs for scraping metrics from different targets.

- Job: Jenkins
```yaml
scrape_configs:
  - job_name: 'jenkins'
    metrics_path: /prometheus
    scheme: http
    static_configs:
      - targets: ['192.168.1.2:8080']
```
- **job_name: 'jenkins'**: This names the scrape job as "jenkins".
- **metrics_path: /prometheus**: This specifies the path on the target where metrics are exposed. For Jenkins, it’s often `/prometheus` if the Prometheus plugin is used.
- **scheme: http**: This defines the protocol to be used for scraping metrics. Here, it's HTTP.
- **static_configs**: This specifies the static configuration for the targets.
    - **targets: ['192.168.1.2:8080']**: This is the list of targets to be scraped. In this case, it's the Jenkins server running on `192.168.1.2` at port `8080`.

- Job: Prometheus
```yaml
  - job_name: 'prometheus'
    static_configs:
      - targets: ['192.168.1.4:9090']
```
- **job_name: 'prometheus'**: This names the scrape job as "prometheus".
- **static_configs**: This specifies the static configuration for the targets.
    - **targets: ['192.168.1.4:9090']**: This is the list of targets to be scraped. In this case, it's the Prometheus server itself running on `192.168.1.4` at port `9090`.


### **Grafana Configuration**

- ### Grafana Configuration Files Explanation

1. `datasources.yml`
   This file defines the data sources for Grafana.

```yaml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://192.168.1.4:9090
    isDefault: true
    editable: true
```

- **apiVersion**: Specifies the version of the Grafana data source provisioning format.
- **datasources**: Lists the data sources to be configured in Grafana.
    - **name**: The name of the data source. Here, it is "Prometheus".
    - **type**: The type of data source, which is "prometheus".
    - **access**: Defines how Grafana will access the data source. "proxy" means Grafana will act as a proxy.
    - **url**: The URL where the Prometheus data source is accessible.
    - **isDefault**: Indicates if this data source should be the default one. It is set to `true`.
    - **editable**: If `true`, allows editing the data source settings via the Grafana UI.

2. `dashboards.yml`
   This file defines the dashboard providers for Grafana.

```yaml
apiVersion: 1

providers:
  - name: 'default'
    orgId: 1
    folder: ''
    type: file
    disableDeletion: false
    updateIntervalSeconds: 10 # how often Grafana will scan for changed dashboards
    options:
      path: /etc/grafana/provisioning/dashboards
```

- **apiVersion**: Specifies the version of the Grafana dashboard provisioning format.
- **providers**: Lists the dashboard providers to be configured in Grafana.
    - **name**: The name of the provider. Here, it is "default".
    - **orgId**: The organization ID to which this provider belongs. It is set to `1`.
    - **folder**: The folder within Grafana where the dashboards will be stored. An empty string means the root folder.
    - **type**: The type of provider, which is "file", meaning it reads dashboards from the file system.
    - **disableDeletion**: If `false`, allows deletion of dashboards via the Grafana UI.
    - **updateIntervalSeconds**: How often (in seconds) Grafana will scan the specified path for updated dashboards. It is set to `10` seconds.
    - **options**: Additional options for the provider.
        - **path**: The file system path where Grafana will look for dashboard definitions. Here, it is `/etc/grafana/provisioning/dashboards`.

These files are essential for configuring Grafana to connect to Prometheus and to manage dashboards efficiently through automated provisioning.

3. dashboard.json: This file is typically used to define a Grafana dashboard in a JSON format. This file contains all the configuration details for a Grafana dashboard, including:

- **Panels**: Each visualization or graph on the dashboard.
- **Rows and Layouts**: How the panels are arranged.
- **Queries**: The data queries that fetch the data to be displayed.
- **Settings**: Various settings like time ranges, refresh intervals, and template variables.


## Step 6: Configure Ansible for Deployment

### `deploy-petclinic.yml`

The `deploy-petclinic.yml` file is an Ansible playbook used to deploy the Spring PetClinic application on an EC2 instance. Below is a detailed explanation of the file:

```yml
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
```
#### Playbook Structure
- **Name:** Deploy Spring PetClinic Application
- **Hosts:** new_ec2 (refers to the group of hosts specified in the `inventory.ini` file)
- **Become:** yes (gives root privileges for the tasks)
- **Vars:**
    - `jar_file`: Path to the Spring PetClinic JAR file

#### Tasks
1. **Update the package list**
    - **Module:** `apt`
    - **Parameters:**
        - `update_cache: yes` (updates the list of available packages and their versions)

2. **Install OpenJDK 17**
    - **Module:** `apt`
    - **Parameters:**
        - `name: openjdk-17-jdk` (name of the package to be installed)
        - `state: present` (ensures the package is installed)

3. **Copy the Spring PetClinic JAR file to the EC2 instance**
    - **Module:** `copy`
    - **Parameters:**
        - `src: "{{ jar_file }}"` (source path of the JAR file on the control node)
        - `dest: /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar` (destination path on the EC2 instance)
        - `mode: '0755'` (permissions of the copied file)
        - `owner: ubuntu` (owner of the copied file)
        - `group: ubuntu` (group of the copied file)

4. **Run the Spring PetClinic application**
    - **Module:** `shell`
    - **Parameters:**
        - `cmd: "nohup java -jar /home/ubuntu/spring-petclinic-3.3.0-SNAPSHOT.jar > /home/ubuntu/petclinic.log 2>&1 &"` (command to run the JAR file in the background and redirect output to a log file)
        - `args: chdir: /home/ubuntu` (changes directory to `/home/ubuntu` before running the command)
    - **Register:** `run_result` (stores the result of the command execution)

5. **Debug - Check if the application is running**
    - **Module:** `shell`
    - **Parameters:**
        - `cmd: "ps aux | grep spring-petclinic-3.3.0-SNAPSHOT.jar"` (command to check if the JAR file is running)
    - **Register:** `ps_result` (stores the result of the command execution)

6. **Debug: Output the run result**
    - **Module:** `debug`
    - **Parameters:**
        - `msg: "Run Result: {{ run_result }}"` (displays the result of the run command)

7. **Debug: Output the process status**
    - **Module:** `debug`
    - **Parameters:**
        - `msg: "Process Status: {{ ps_result }}"` (displays the status of the running process)

---

### `inventory.ini`

The `inventory.ini` file specifies the hosts that Ansible will manage. Below is a detailed explanation of the file:

```ini
[new_ec2]  
3.14.144.37 ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/root/.ssh/petclinic_key_pair.pem
```
#### Inventory Structure
- **Group:** new_ec2
    - **Host:** IP address of the EC2 instance
    - **Parameters:**
        - `ansible_ssh_user=ubuntu` (specifies the SSH user to connect as)
        - `ansible_ssh_private_key_file=/root/.ssh/petclinic_key_pair.pem` (path to the SSH private key file)


## Step 8: Execution and Verification



1. **Docker Compose Setup - Initial Pulling of Images**
    - **Context:** This step involves pulling the required Docker images for the containers defined in the `docker-compose.yml` file.
    - ![[01_deployment_and_verification.png]]

2. **Docker Compose Setup - Containers Running**
    - **Context:** After pulling the images, the containers are started. This ensures all the necessary services like Jenkins, Grafana, SonarQube, Prometheus, and OWASP ZAP are running.
    - ![[02_deployment_and_verification.png]]

3. **Docker Dashboard - All Containers Running**
    - **Context:** This view from the Docker dashboard confirms that all containers required for the pipeline are up and running, showing their statuses and ports.
    - ![[03_deployment_and_verification.png]]

4. **Jenkins Login Page**
    - **Context:** Accessing the Jenkins web interface requires logging in with the admin credentials.
    - ![[04_deployment_and_verification.png]]

5. **Jenkins Dashboard - Welcome Page**
    - **Context:** The initial dashboard after logging into Jenkins, where you can start setting up jobs and configure the Jenkins environment.
    - ![[05_deployment_and_verification.png]]

6. **Jenkins Global Credentials Configuration**
    - **Context:** Configuring global credentials in Jenkins to securely store AWS credentials, GitHub tokens, and SonarQube tokens, which are required for various stages of the pipeline.
    - ![[06_deployment_and_verification.png]]

7. **Jenkins - Creating a New Pipeline Project**
    - **Context:** Setting up a new pipeline project in Jenkins for the DevOps final project. This involves entering the project name and selecting the pipeline type.
    - ![[07_deployment_and_verification.png]]
8. **Jenkins - Pipeline Configuration**
    - **Context:** Configuring the pipeline script, environment variables, build triggers, and other settings. This script defines all the stages and steps of the CI/CD pipeline.
    - ![[08_deployment_and_verification.png]]

9. **Jenkins - Initial Pipeline Setup**
    - **Context:** The view of the Jenkins project after initial setup, showing options like build now, configure, and status. No builds have been triggered yet.
    - ![[10_deployment_and_verification.png]]

10. **Jenkins - Build History**
    - **Context:** This view shows the build history and allows tracking the progress and status of each build. It also provides access to console outputs and other build data.
    - ![[11_deployment_and_verification.png]]



1. **Jenkins Pipeline Execution Start**
    - The pipeline is initiated, showing the build process in Jenkins, including the time the build started and the details of the Git repository used.
    - ![[11_deployment_and_verification.png]]

2. **Pipeline Console Output**
    - The console output of the Jenkins pipeline execution shows detailed logs of the steps being executed, including verification messages and publishing of reports.
    - ![[12_deployment_and_verification.png]]


3. **Git Build Data**
    - This view provides information about the Git build data, including the revision and repository details, indicating that the build process has retrieved the code from the specified repository.
    - ![[13_deployment_and_verification.png]]

1. **Jenkins Blue Ocean Pipeline View**
    - The Blue Ocean view offers a visual representation of the pipeline stages and steps, showing a successful pipeline execution with all stages completed.
    - ![[14_deployment_and_verification.png]]




1. **ZAP Scanning Report**
    - The ZAP scanning report highlights the security vulnerabilities detected during the static analysis stage of the pipeline, providing detailed information about each alert.
    - ![[15_deployment_and_verification.png]]

6. **Spring PetClinic Application**
    - The Spring PetClinic application is shown running, indicating a successful deployment to the AWS EC2 instance. This view is part of the verification stage, confirming that the application is operational.
    - ![[16_deployment_and_verification.png]]

7. **Spring PetClinic Veterinarian List**
    - The updated list of veterinarians in the Spring PetClinic application verifies that the changes from the `data.sql` file have been correctly applied.
    - ![[19_deployment_and_verification.png]]
      ![[21_deployment_and_verification.png]]


8. **GitHub Pull Request for Data Update**
    - The pull request in GitHub showcases the changes made to the `data.sql` file, including the insertions of new data entries for veterinarians, owners, pets, and visits.
    - ![[17_deployment_and_verification.png]]

9. **GitHub Pull Request Merge Confirmation**
    - The successful merge of the pull request confirms that the updates have been integrated into the main branch, ready for the next deployment cycle.
    - ![[18_deployment_and_verification.png]]

10. Build got initiated automatically for the second time after code changes

    ![[22_deployment_and_verification.png]]

11. Changes to the code verified
    ![[23_deployment_and_verification.png]]

    12. Console output: SUCCESS for the second run
        ![[24_deployment_and_verification.png]]
1. **Final Verification**
    - A final check of the veterinarian list confirms the successful deployment and update process, completing the pipeline verification.
    -

# Journal


1. **Maven Installation Issue on Jenkins:**
    - **Context:** During the initial setup of the Jenkins pipeline.
    - **Problem:** `Tool type "maven" does not have an install of "Maven 3.6.3" configured`.
    - **Solution:** Ensured Maven was correctly configured in Jenkins or used a Docker image with Maven pre-installed to avoid configuration issues.

2. **SonarQube Configuration:**
    - **Context:** Setting up SonarQube for static analysis in the Jenkins pipeline.
    - **Problem:** `No SonarQube installation assigned for this job`.
    - **Solution:** Configured SonarQube correctly in Jenkins, ensuring the proper connection and authentication setup.

3. **Static Analysis Failure:**
    - **Context:** Running static analysis using SonarQube in the Jenkins pipeline.
    - **Problem:** `Error during static analysis: hudson.AbortException: script returned exit code 125`.
    - **Solution:** Verified Docker daemon was running and accessible. Ensured SonarQube scanner was properly configured and had necessary permissions.

4. **Docker Platform Compatibility:**
    - **Context:** Building Docker images for the pipeline.
    - **Problem:** `docker: no matching manifest for linux/arm64/v8`.
    - **Solution:** Ensured compatible Docker images were used, appropriate for the target platform.

5. **General Pipeline Failures:**
    - **Context:** Various stages in the Jenkins pipeline.
    - **Problem:** Stages failing due to incorrect configurations or missing files.
    - **Solution:** Added error handling and validation steps, ensured all required files were in place, and verified configurations before execution.

6. **Permissions for Docker Socket Binding:**
    - **Context:** Running Docker commands from Jenkins.
    - **Problem:** "Docker: permission denied" error when binding Docker socket.
    - **Solution:** Ran the container as root or added the container user to the Docker group. Adjusted Docker socket permissions on the host.

7. **SSH Key Issues:**
    - **Context:** Connecting to EC2 instances from Jenkins.
    - **Problem:** SSH key-related errors when connecting to EC2 instances.
    - **Solution:** Generated a new key pair if necessary, and ensured the correct key was used and properly configured in Jenkins and AWS.

8. **File Copying and Path Issues in Jenkins Pipeline:**
    - **Context:** Copying SSH key file in the Jenkins pipeline.
    - **Problem:** Errors while copying the SSH key file.
    - **Solution:** Ensured correct paths and permissions. Used absolute paths and ensured the file existed at the specified location.

9. **ZAP Container Issues:**
    - **Context:** Running ZAP analysis in the Jenkins pipeline.
    - **Problem:** `Failed to access summary file /home/zap/zap_out.json`.
    - **Solution:** Ensured proper directory creation and file access permissions within the ZAP container.

10. **Accessing Application URL:**
    - **Context:** After deploying the application.
    - **Problem:** Unable to access the application at `http://192.168.1.2:8082`.
    - **Solution:** Ensured the application was correctly deployed and running, and verified network configurations to allow access.

11. **AWS EC2 Instance Creation and Configuration:**
    - **Context:** Creating and configuring EC2 instances in the Jenkins pipeline.
    - **Problem:** Various errors in creating and configuring EC2 instances, including invalid AMI IDs, security group issues, and SSH connection problems.
    - **Solution:** Verified AMI IDs, security group configurations, and ensured correct credentials. Added retries and proper error handling in the Jenkins pipeline.

12. **Java Version Compatibility:**
    - **Context:** Running the Spring PetClinic application on the EC2 instance.
    - **Problem:** Java runtime version mismatch on the EC2 instance.
    - **Solution:** Installed the correct version of Java (OpenJDK 17) using Ansible in the deployment playbook.

13. **Ansible Playbook Failures:**
    - **Context:** Deploying the application using Ansible.
    - **Problem:** Errors during various Ansible tasks, including adding repositories and copying files.
    - **Solution:** Fixed syntax issues, ensured correct permissions, and used appropriate Ansible modules and parameters.

14. **Grafana Data Source Provisioning Error:**
    - **Context:** Setting up Grafana data sources.
    - **Problem:** `Datasource provisioning error: datasource.yaml config is invalid. Only one datasource per organization can be marked as default`.
    - **Solution:** Ensured only one data source was marked as default in the `datasource.yml` file.

15. **No Such File Exception for Grafana Dashboard:**
    - **Context:** Importing Grafana dashboards in Jenkins.
    - **Problem:** `java.nio.file.NoSuchFileException: /var/jenkins_home/workspace/bbbb/grafana/dashboards/dashboard.json`.
    - **Solution:** Ensured the correct path was used and the file existed. Placed the `dashboard.json` file in the correct directory and verified the path in the Jenkins pipeline.

16. **Prometheus Targets Not Being Scraped:**
    - **Context:** Setting up Prometheus for monitoring.
    - **Problem:** `Prometheus is not scraping targets correctly`.
    - **Solution:** Verified Prometheus configuration and ensured targets were correctly defined. Checked network connectivity between Prometheus and the targets.

17. **Jenkins Job Failure:**
    - **Context:** Running Jenkins jobs.
    - **Problem:** Jenkins job failed with a `hudson.AbortException`.
    - **Cause:** Multiple potential causes, including the non-availability of `curl` in the Docker container used for the Jenkins job.
    - **Solution:** Ensured `curl` was available in the Docker container by installing it or using a pre-configured container.

18. **Grafana API Key Issue:**
    - **Context:** Importing Grafana dashboards.
    - **Problem:** Invalid API key error.
    - **Solution:** Successfully generated and used a service account token instead of a direct API key.

19. **Grafana Organization Creation:**
    - **Context:** Creating Grafana organizations.
    - **Problem:** Attempted to create an organization with a name that was already taken, resulting in an error.
    - **Solution:** Handled the error gracefully by checking the response and skipping organization creation if it already existed.

20. **SonarQube Report Redirect:**
    - **Context:** Generating SonarQube reports.
    - **Problem:** The SonarQube report did not automatically redirect to the SonarQube dashboard URL.
    - **Solution:** Created an HTML file with a meta-refresh tag to handle the redirection properly.

21. **Jenkins Pipeline Insecure Interpolation Warning:**
    - **Context:** Passing sensitive variables in Jenkins.
    - **Problem:** Sensitive variables such as `GITHUB_TOKEN`, `SONARQUBE_LOGIN`, and `GRAFANA_ADMIN_PASS` were passed insecurely.
    - **Solution:** Used the `withCredentials` block to handle sensitive information securely.

22. **SonarQube Authentication Token Management:**
    - **Context:** Managing SonarQube authentication tokens.
    - **Problem:** Hardcoded SonarQube login tokens.
    - **Solution:** Used Jenkins credentials to securely store and access the SonarQube authentication token.

23. **SSH Service Issues:**
    - **Context:** Starting SSH service in different environments.
    - **Problem:** Errors when trying to start SSH service.
    - **Solution:** Used appropriate commands to start SSH service based on the environment.

24. **Running Docker Commands from Jenkins:**
    - **Context:** Running Docker commands from Jenkins.
    - **Problem:** `docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock`.
    - **Solution:** Mounted Docker socket in Jenkins container or ran Docker commands from the host.

25. **Resource Usage Concerns:**
    - **Context:** Managing AWS resources.
    - **Problem:** High resource usage and potential costs from AWS.
    - **Solution:** Implemented checks to reuse existing instances and monitored resource usage.

26. **Grafana Initial Password Setup:**
    - **Context:** Setting up initial Grafana password.
    - **Problem:** Grafana prompts for initial password setup.
    - **Solution:** Configured the initial admin user and password in the `grafana.ini` file or via environment variables.












