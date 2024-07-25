pipeline {
    agent any

    environment {
        // DOCKER_NETWORK = 'dev_network' 
        mvnHome = tool name: 'maven397', type: 'hudson.tasks.Maven$MavenInstallation'
        
    }

    stages {
        stage('Checkout') {
            steps {
                // git branch: 'main', credentialsId: 'github', url: 'https://github.com/quintian/DevOps-FinalProject'
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/rponcepo/spring-petclinic.git'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh """
                        # cd spring-petclinic
                        ${mvnHome}/bin/mvn clean package
                        sudo service docker start &
                    """
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh """
                        # cd spring-petclinic
                        ${mvnHome}/bin/mvn test
                    """
                }
            }
        }

        stage('Static Analysis') {
            steps {
                script {
                    withSonarQubeEnv() {
                        sh './mvnw sonar:sonar'
                    }
                }
            } 
        }

        stage('Run Test Instance') {
            steps {
                script { 
                    sh """
                        # cd spring-petclinic
                        nohup ${mvnHome}/bin/mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &
                        sleep 5
                    """
                }
            }
        }



        stage('OWASP ZAP Scan') {
            steps{
                script{
                    try {
                        sh """  
                        docker run --privileged -v /var/jenkins_home/workspace/:/zap/wrk:rw \
                        --user root \
                        -t zaproxy/zap-weekly  \
                        zap-baseline.py -t http://\$(ip -f inet -o addr show docker0 | awk '{print \$4}' | cut -d '/' -f 1):8082 \
                        -r report_html.html \
                        || true
                        """ 
                    } catch (Exception e) {
                        echo "Error occurred during OWASP ZAP Scan: ${e}"
                    }
                } 
            }
        }

        stage('cleanup'){
            steps{
                script{
                    sh "sudo service docker stop"
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                script { 
                    ansiblePlaybook(
                        credentialsId: 'web-server',
                        playbook: '/opt/ansible/playbook.yml',
                        inventory: '/opt/ansible/inventory.ini'
                    )
                }
            }
        }
        
        
    }

    post {
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline encountered fatal error'
        }
        always {
            // Publish OWASP ZAP report
            publishHTML([
                reportDir: '/var/jenkins_home/workspace/',
                reportFiles: 'report_html.html',
                reportName: 'OWASP ZAP Report',
                keepAll: true,
                allowMissing: false,
                alwaysLinkToLastBuild: true
            ])
        }
    }
}