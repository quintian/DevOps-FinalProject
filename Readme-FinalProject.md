## 3. Confugure SonarQube and Blue Ocean
- Install the sonarqube plugin in Jenkins-> Manage Jenkins -> Plugins. Also install Blue Ocean plugin.
- Create a sonarqube installation in Jenkins->Manage Jenkins->Tools
- While the sonarqube container is running, go to http://localhost:9000
- Log in with admin as username and password. Create a new password if prompted.
- In Sonarqube-> Administration->Security, generate a new token and save it somewhere.
- In a terminal, run `ipconfig /all` and make note of your IPV4 address.
- In Jenkins->Manage Jenkins-> System, Create a sonarqube server. For credentials, create a new secret text as your IPV4 address. For the server url use http://`your IPV4`:9000
- Click 'Use Blue Ocean' to change the user interface for better visualization of the build process. You can restart each stage and view/download their logs seperately. 
- Now if you run the project, the Sonarqube analysis stage in the Jenkinsfile  will send the data to that server url and you can see the analysis results there. The project will be called petclinic.
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
