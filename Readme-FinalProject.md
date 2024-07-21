```
  stage('Static Analysis') {
            steps {
                script {
                    withSonarQubeEnv() {
                        sh './mvnw sonar:sonar'
                    }
                }
            }
  ```

