pipeline {
    agent any

    environment {
        DOCKER_NETWORK = 'dev_network' 
        mvnHome = tool name: 'maven397', type: 'hudson.tasks.Maven$MavenInstallation'
        
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'runTest', credentialsId: 'github', url: 'https://github.com/quintian/DevOps-FinalProject'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    sh """
                        cd spring-petclinic
                        ${mvnHome}/bin/mvn clean package
                        cp target/*.jar ${env.WORKSPACE}/
                    """
                    def jarFile = "${env.WORKSPACE}/target/*.jar"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh """
                        cd spring-petclinic
                        ${mvnHome}/bin/mvn test
                    """
                }
            }
        }

        stage('Run') {
            steps {
                script { 
                    sh """
                        cd spring-petclinic
                        nohup ${mvnHome}/bin/mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &
                    """
                }
            }
        }

        /*
        stage('Wait for Application') {
            steps {
                script {
                    timeout(time: 2, unit: 'MINUTES') {
                        waitUntil {
                            script {
                                def response = sh(
                                    script: 'curl -s -o /dev/null -w "%{http_code}" http://localhost:8082/actuator/health',
                                    returnStdout: true
                                ).trim()
                                return response == '200'
                            }
                        }
                    }
                }
            }
        }
        */

        

        stage('OWASP Dependency Analysis') {
            agent {
                docker {
                    image 'zaproxy/zap-stable'
                    args "-p 8084:8080 -v ${env.WORKSPACE}:/zap/wrk " //So that ZAP can attack correctly. Need to expose 8083:8083 in base image; or just 8083....
                }
            }
            steps{
                sh "zap-baseline.py -t jenkins:8082 -r report_html"
            }
        }
        

        stage('Static Analysis') {
            steps {
                script {
                    withSonarQubeEnv('SonarQube') {
                        sh './mvnw sonar:sonar'
                    }
                }
            }
        }

        //Pretty sure we don't want to run here; we want Ansible to run it on a VM.

        
    }

    post {
        success {
            echo 'Build successful.'
        }
        failure {
            echo 'Build Failure.'
        }
    }
}