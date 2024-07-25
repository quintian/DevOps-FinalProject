pipeline {
    agent any

    environment {
        DOCKER_NETWORK = 'dev-network'
        DOCKER_IMAGE = 'akashcha/spring-petclinic'
        ZAP_CONTAINER_NAME = 'owasp-zap'
        ZAP_URL = 'http://192.168.1.6:8081'
        SONARQUBE_URL = 'http://192.168.1.3:9000' // URL of the SonarQube server
        SONARQUBE_LOGIN = 'squ_f33d0568a7c9e6d8c427d516affc3fe531b2b69a' // Authentication token for SonarQube
        DEPLOYMENT_URL = 'http://192.168.1.2:8082' // Placeholder for the application URL
        SSH_USER = 'vagrant' // Vagrant default user
        TARGET_HOST = '192.168.56.10' // The static IP address of the VM
    }

    stages {
            stage('Setup Docker Network') {
                steps {
                    echo 'Setting up Docker network...'
                    sh 'docker network create ${DOCKER_NETWORK} || true'
                }
            }

        stage('Checkout') {
            steps {
                echo 'Checking out the repository...'
                git branch: 'main', url: 'https://github.com/akashcha/spring-petclinic.git'
                echo 'Repository checked out successfully.'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh """
                        # cd spring-petclinic
                        mvn clean package
                    """
                }
            }
        }

   //   stage('Setup VM with Vagrant') {
   //       steps {
   //           script {
   //               try {
   //                   sh 'sh setup-vagrant.sh'
   //               } catch (Exception e) {
   //                   echo "Error during VM setup with Vagrant: ${e}"
   //                   currentBuild.result = 'FAILURE'
   //               }
   //           }
   //       }
   //   }

   //     stage('Test') {
   //         steps {
   //             script {
   //                 sh """
   //                     # cd spring-petclinic
   //                     mvn test
   //                 """
   //             }
   //         }
   //     }


    //    stage('Run Test Instance') {
    //        steps {
    //            script {
    //                sh """
    //                    # cd spring-petclinic
    //                    nohup mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &
    //                    sleep 5
    //                """
    //            }
    //        }
    //    }


        stage('Static Analysis') {
            steps {
                echo 'Starting static analysis...'
                script {
                    try {
                        // Run Maven build to ensure the project is compiled and ready for analysis
                        sh 'mvn clean verify'

                        // Run SonarQube analysis
                                sh """
                                    docker run --rm \
                            --platform linux/amd64 \
                                    --network ${env.DOCKER_NETWORK} \
                                    -v \$(pwd):/usr/src \
                                    -w /usr/src \
                                    sonarsource/sonar-scanner-cli \
                                    sonar-scanner \
                                    -Dsonar.projectKey=spring-petclinic \
                                    -Dsonar.sources=. \
                            -Dsonar.java.binaries=target/classes \
                                    -Dsonar.host.url=${env.SONARQUBE_URL} \
                                    -Dsonar.login=${env.SONARQUBE_LOGIN}
                                """
                        echo 'Static analysis completed successfully.'
                    } catch (Exception e) {
                        echo "Error during static analysis: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
                echo 'Static analysis stage completed.'
            }
        }

        stage('Run Test Instance') {
            steps {
                script {
                    sh """
                        # cd spring-petclinic
                        nohup mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8082 &
                        sleep 5
                    """
                }
            }
        }

//               stage('Deploy with Ansible') {
//           steps {
//               script {
//                   try {
//                       sh """
//                           ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.vagrant.d/insecure_private_key ${SSH_USER}@${TARGET_HOST} "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.vagrant.d/insecure_private_key.pub
//                       """
//                       sh """
//                           ansible-playbook -i /opt/ansible/inventory.ini /opt/ansible/playbook.yml --private-key ~/.vagrant.d/insecure_private_key
//                       """
//                   script {
//                           env.DEPLOYMENT_URL = 'http://192.168.56.10:8082'
//                       echo "Application deployed at ${env.DEPLOYMENT_URL}"
//                   }
//                   } catch (Exception e) {
//                       echo "Error during deployment with Ansible: ${e}"
//                       currentBuild.result = 'FAILURE'
//                   }
//               }
//           }
//       }



        stage('Prepare ZAP Analysis using socket') {
            steps {
                script {
                    try {

                        // Run the ZAP baseline scan
                        sh """
                            docker exec --privileged --user root ${env.ZAP_CONTAINER_NAME} zap-baseline.py \
                                -t ${env.DEPLOYMENT_URL} \
                                -r zap-report.html
                        """
                    } catch (Exception e) {
                        echo "Error during preparing ZAP Analysis Script: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }

        stage('Copy ZAP Report') {
            steps {
                script {
                    try {
                        sh """
                            # Copy the report from the container to the Jenkins workspace
                            docker cp ${env.ZAP_CONTAINER_NAME}:/zap/wrk/zap-report.html ./zap-report.html
                        """
                    } catch (Exception e) {
                        echo "Error during copying ZAP report: ${e}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
        }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Pipeline completed successfully.'
    }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
