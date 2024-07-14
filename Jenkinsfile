
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'camelCaseCurryGithubPAT', url: 'https://github.com/quintian/DevOps-FinalProject'
                
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
