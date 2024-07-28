pipeline {
    agent any

    environment {
        PROJECT_NAME = 'devops-finalproject-akash'
        DOCKER_NETWORK = "${PROJECT_NAME}_dev-network"
        JENKINS_URL = '10.120.64.242:8080'
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
        GITHUB_REPO = "akashcha/spring-petclinic"
        WEBHOOK_URL = "http://${JENKINS_URL}/github-webhook/"
        GITHUB_TOKEN = credentials('github-token')
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

        stage('Create GitHub Webhook') {
            steps {
                script {
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
                    sh """
                    curl -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Content-Type: application/json" \
                    -d '${payload}' "https://api.github.com/repos/${GITHUB_REPO}/hooks"
                    """
                }
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
