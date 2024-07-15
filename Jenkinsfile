pipeline {
    agent any

    environment {
        DOCKER_NETWORK = 'dev_network' 
        DOCKER_IMAGE = 'sandboxSpringPetClinic'
        DOCKERFILE_PATH = 'sandbox_dockerfile'
        def mvnHome = tool name: 'maven397', type: 'hudson.tasks.Maven$MavenInstallation'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'newCont', credentialsId: 'rponcepoGithubPATglobal', url: 'https://github.com/quintian/DevOps-FinalProject'
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
                        ${mvnHome}/bin/mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082
                    """
                }
            }
        }

        /*
        stage('Build Sandbox Container') {
            steps {
                script {
                    def jarFile = "${env.WORKSPACE}/target/*.jar"
                    node {
                        def app = docker.build("${DOCKERFILE_PATH}")
                        app.inside {
                            sh "java -jar ${jarFile}"
                        }
                    }
                }

                
                script {
                    docker.image()
                }
            }
        }
        */
    

        /*
        stage('OWASP Dependency Analysis') {
            agent {
                docker { zaproxy/zap-stable }
            }
            steps{
                // OWASP dependency steps
                sh "zap-baseline.py -t https://www.example.com -r report_html"
            }
        }
        */

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