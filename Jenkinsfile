pipeline {
    agent any
    
    environment {
        DOCKER_COMPOSE_PATH = "/Users/Otaku/OneDrive/Desktop/Final Project/docker_compose.yml"
    }

    stages {
        stage('Checkout') {
            steps {
                //git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
                git branch: 'main', credentialsId: 'camelCaseCurryPAT', url: 'https://github.com/quintian/DevOps-FinalProject.git'
            }
        }
        stage('Build') {
            steps {
                dir('spring-petclinic-pipeline/spring-petclinic') {
                    sh './mvnw clean install'
                }
            }
        }
        stage('Test') {
            steps {
                dir('spring-petclinic-pipeline/spring-petclinic')  {
                    sh './mvnw test'
                }
            }
        }
        stage('Static Analysis') {
            steps {
                script {
                    
                    sh "echo SonarQube analysis steps (to be added later)"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "echo Deployment steps using Ansible (to be added later)"
                }
            }
        }
    }
}
