pipeline {
    agent any
    
    environment {
        DOCKER_COMPOSE_PATH = "/Users/qt/Documents/17636-DevOps/FinalProject/docker-compose.yml"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                dir('finalproject/spring-petclinic') {
                    sh './mvnw clean install'
                }
            }
        }
        stage('Test') {
            steps {
                dir('finalproject/spring-petclinic') {
                    sh './mvnw test'
                }
            }
        }
        stage('Static Analysis') {
            steps {
                script {
                    // SonarQube analysis steps (to be added later)
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deployment steps using Ansible (to be added later)
                }
            }
        }
    }
}
