
## Confugure SonarQube and Blue Ocean
- Install the Sonarqube Scanner (latest version) plugin in Jenkins-> Manage Jenkins -> Plugins.
- Also install Blue Ocean (latest version) plugin.
- Create a Sonarqube Scanner installation in Jenkins->Manage Jenkins->Tools. Check the install automatically box and get the latest version  via 'Install from Maven Central'.
- While the sonarqube container is running, go to http://localhost:9000
- Log in with admin as username and password. Create a new password if prompted.
- In Sonarqube-> Administration->Security, generate a new token and save it somewhere.
- In a terminal, run `ipconfig /all` and make note of your IPV4 address.
- In Jenkins->Manage Jenkins-> System, Create a Sonarqube server. Check the use as environmental varuable box. For credentials, create a new secret text as your saved sonarqube token. For the server url use http://`your IPV4`:9000. 
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
- The analysis will show you warnings about the security, mainatanability and reliability of the code in the spring petclinc project. Each aspect is graded on a letter scale and issues classified by impact, High, Medium and Low. We saw 16 high impact maintanability issues and one medium impact reliability issue. You can click on these categories to see a breakdown of the specific issues.
- Bear in mind that if the analysis has been done before and there is no new code in spring pet clinic, you will have to go to the 'Overall' tab instead of the default 'New Code' tab to see the whole result.
