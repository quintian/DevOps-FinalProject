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
}
