pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/quintian/DevOps-FinalProject.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package'
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

        stage('Security Analysis') {
            steps {
                script {
                  //  TBD
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                // TBD
                }
            }
        }
    }
}
