// pipeline {
//     agent {
//         kubernetes {
//             yaml """
//             apiVersion: v1
//             kind: Pod
//             spec:
//               containers:
//               - name: my-container
//                 image: my-image
//                 command:
//                 - cat
//                 tty: true
//             """
//         }
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/quintian/spring-petclinic.git']]])
//             }
//         }
//         stage('Build') {
//             steps {
//                 sh 'mvn clean package'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh 'mvn test'
//             }
//         }
       
//         stage('Deploy') {
//             steps {
//                 // Example deployment steps
//                 sh 'docker-compose up -d'
//             }
//         }
//     }
// }


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
// this version works on 
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/quintian/spring-petclinic', branch: 'main'
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
                    sh "${mvnHome}/bin/mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8090"
                }
            }
        }
    }
}
