// pipeline {
//     agent any
    
//     environment {
//         DOCKER_COMPOSE_PATH = "/Users/qt/Documents/17636-DevOps/FinalProject/docker-compose.yml"
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
//             }
//         }
//         stage('Build') {
//             steps {
//                 dir('finalproject/spring-petclinic') {
//                     sh './mvnw clean install'
//                 }
//             }
//         }
//         stage('Test') {
//             steps {
//                 dir('finalproject/spring-petclinic') {
//                     sh './mvnw test'
//                 }
//             }
//         }
//         stage('Static Analysis') {
//             steps {
//                 script {
//                     // SonarQube analysis steps (to be added later)
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 script {
//                     // Deployment steps using Ansible (to be added later)
//                 }
//             }
//         }
//     }
// }

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    sh "${mvnHome}/bin/mvn clean package"
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
        stage('Run') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    sh "${mvnHome}/bin/mvn spring-boot:run"
                }
            }
        }
    }
}
