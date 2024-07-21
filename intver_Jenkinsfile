pipeline {
    agent any
    
    environment {
        DOCKER_COMPOSE_PATH = "/Users/Otaku/OneDrive/Desktop/Final Project/docker_compose.yml"
        //DOCKER_IMAGE = 'sandboxSpringPetClinic'
        //DOCKERFILE_PATH = 'sandbox_dockerfile'
        SCANNER_HOME=tool 'SonarQube'
    }


    stages {
        stage('Checkout') {
            steps {
                //git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
                //git branch: 'camel', credentialsId: 'camelCaseCurryPAT', url: 'https://github.com/quintian/DevOps-FinalProject.git'
                git branch: 'camel', credentialsId: 'camelCaseCurryPAT', url: 'https://github.com/camelCaseCurry/spring-petclinic'
            }
        }
        stage('Compile') {
            steps {
                sh './mvnw clean compile'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
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
        stage('OWASP ZAP Scan') {
            steps{
                script{
                    try {
                        sh "id"
                        sh """
                        docker run --privileged -v /var/jenkins_home/workspace/:/zap/wrk:rw \
                        --user root \
                        -t zaproxy/zap-weekly  \
                        zap-baseline.py -t http://\$(ip -f inet -o addr show docker0 | awk '{print \$4}' | cut -d '/' -f 1):8082 \
                        -r report_html.html \
                        || true
                        """ 
                        // > ${env.WORKSPACE}
                    } catch (Exception e) {
                        echo "Error occurred during OWASP ZAP Scan: ${e}"
                    }
                } 
            }
        }
        stage('Build') {
            steps {
                dir('/var/jenkins_home/workspace/finalproject') {
                    //sh "ls"
                    sh './mvnw clean install'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "echo Deployment"
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
