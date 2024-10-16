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
        SONARQUBE_DASHBOARD_URL = "http://localhost:9000/dashboard?id=spring-petclinic"
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
                    """
                }
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
                                    -Dsonar.exclusions=**/excluded-directory/**,**/*.tmp,**/*.log,**/zap-report.html,**/grafana-report.html \
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
