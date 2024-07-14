
pipeline {
    agent any

    environment {
        DOCKER_NETWORK = 'dev_network'
        DOCKER_IMAGE = 'sandboxSpringPetClinic'
        DOCKERFILE_PATH = 'sandbox_dockerfile'
    }


    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'rponcepoGithubPAT', url: 'https://github.com/quintian/DevOps-FinalProject'
            }
        }
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    sh "cd spring_petclinic"
                    sh "${mvnHome}/bin/mvn clean package"
                    // Copying the .jar output to the Jenkins Workspace. This is so OWASP-ZAP can scan it later.
                    def jarFile = "${env.WORKSPACE}/target/*.jar"
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    sh "${mvnHome}/bin/mvn test"
                }
            }
        }
        stage('Monitor Jenkins') {
            steps {
                script {
                    // TBD: Prometheus monitoring
                    echo 'Setting up Prometheus monitoring for Jenkins'
                }
            }
        }

        stage('Setup Grafana Dashboard') {
            steps {
                script {
                    // TBD: Setup Grafana dashboard
                    echo 'Setting up Grafana dashboard'
                }
            }
        }
        stage('Build Sandbox Container') {
            steps {
                script {
                    sh "docker build -t ${dockerImage} --build-arg JAR=${jarFile} -f ${dockerfilePath} ."
                    sh "docker run ${dockerImage} --network dev_network "
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
        stage('Run') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    sh "${mvnHome}/bin/mvn spring-boot:run"
                }
            }
        }
        stage('Deploy') {
        }
        */
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
