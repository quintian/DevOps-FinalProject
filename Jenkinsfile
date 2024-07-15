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
                git branch: 'appCont', credentialsId: 'rponcepoGithubPATglobal', url: 'https://github.com/quintian/DevOps-FinalProject'
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

        stage('Build Sandbox Container') {
            steps {
                script {
                    def jarFile = "${env.WORKSPACE}/target/*.jar"
                    sh "docker build -t ${DOCKER_IMAGE} --build-arg JAR=${jarFile} -f ${DOCKERFILE_PATH} ."
                    sh "docker run ${DOCKER_IMAGE} --network ${DOCKER_NETWORK}"
                }
            }
        }

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

        stage('Run') {
            steps {
                script {
                    sh """
                        cd spring-petclinic
                        ${mvnHome}/bin/mvn spring-boot:run
                    """
                }
            }
        }

        
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