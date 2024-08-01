


# Tooling

## Host Operating System Details: 

Operating System: macOS Monterey, version 12.3.1

Chipset: Intel Core i5

## Software used: 

Docker version: 20.10.8, build 3967b7d

Docker Desktop version: 4.30.0

Docker Compose version v2.27.0-desktop.2

Visual Studio Code version: 1.89.0 (Universal)

VSCode extention: Docker v1.29.1
(Note: I use VSCode as editor, but any editor would work. )

Jenkins Notes Jenkins 2.452.3

# Steps

## 1. Initial setup network and 5 contianers 

- Create a 'FinalProject' folder in your local machine and cd to this folder
- fork the project: https://github.com/quintian/spring-petclinic.git, and clone to in FinalProject folder

`git clone https://github.com/quintian/spring-petclinic.git
`

Output: 

> (base) qt@Quinns-MBP-2 FinalProject % git clone https://github.com/quintian/spring-petclinic.git
> Cloning into 'spring-petclinic'...
> remote: Enumerating objects: 9967, done.
> remote: Total 9967 (delta 0), reused 0 (delta 0), pack-reused 9967
> Receiving objects: 100% (9967/9967), 7.55 MiB | 7.42 MiB/s, done.
> Resolving deltas: 100% (3762/3762), done.


- Create dev-network

`docker network create dev-network`

Output: 

> (base) qt@Quinns-MBP-2 FinalProject % docker network create dev-network
> 44545c729860fbf9d0a31132a3319a0888261dd8e089542f80ccc830b07c3b9d

- Create /finalproject/docker-compose.yml file, and run it
```

version: '3'
services:
  jenkins:
    image: jenkins/jenkins:lts
    ports:
 	  - "8082:8080"
      - "8090:8090"
    networks:
      - dev-network

  sonarqube:
    image: sonarqube
    ports:
      - "9000:9000"
    networks:
      - dev-network

  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    networks:
      - dev-network

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    networks:
      - dev-network

  owaspzap:
    image: securecodebox/zap
    ports:
      - "8081:8080"
    networks:
      - dev-network

networks:
  dev-network:
    external: true

```
run command: 

`FinalProject % docker-compose up -d`

Output: 

> (base) qt@Quinns-MBP-2 FinalProject % docker-compose up -d
> Pulling owaspzap (securecodebox/zap:)...
> latest: Pulling from securecodebox/zap
> e7c96db7181b: Pull complete
> f910a506b6cb: Pull complete
> c2274a1a0e27: Pull complete
> c0cb8da6b6d4: Pull complete
> d157ce952581: Pull complete
> 2d53a402b3bd: Pull complete
> 35e8e462716b: Pull complete
> b0804c2361bb: Pull complete
> b589499fe609: Pull complete
> 3cec367fa38a: Pull complete
> 40ce8b78ea5c: Pull complete
> 392403372aa3: Pull complete
> Digest: sha256:9d8382f2bb102d53f7b2472584671d5b886b9bf0ceeedfe46b2ff02736a798e1
> Status: Downloaded newer image for securecodebox/zap:latest
> finalproject_jenkins_1 is up-to-date
> finalproject_sonarqube_1 is up-to-date
> finalproject_grafana_1 is up-to-date
> finalproject_prometheus_1 is up-to-date
> Creating finalproject_owaspzap_1 ... done

- Ensure the 5 containers are built and running

run command: 

`docker-compose ps
`
Output: 

> (base) qt@Quinns-MBP-2 FinalProject % docker-compose ps
>           Name                         Command                   State                      Ports              
> ---------------------------------------------------------------------------------------------------------------
> finalproject_grafana_1      /run.sh                          Up               0.0.0.0:3000->3000/tcp           
> finalproject_jenkins_1      /usr/bin/tini -- /usr/loca ...   Up               50000/tcp, 0.0.0.0:8080->8080/tcp
> finalproject_owaspzap_1     /home/zap/init.sh                Up (unhealthy)   0.0.0.0:8081->8080/tcp, 8090/tcp 
> finalproject_prometheus_1   /bin/prometheus --config.f ...   Up               0.0.0.0:9090->9090/tcp           
> finalproject_sonarqube_1    /opt/sonarqube/docker/entr ...   Up               0.0.0.0:9000->9000/tcp 



## 2. Create Jenkins pipeline that uses the forked GitHub repo 

- Find Jenkins password

Run command:
`docker exec finalproject_jenkins_1  cat /var/jenkins_home/secrets/initialAdminPassword

`
Output: 


> (base) qt@Quinns-MBP-2 FinalProject % docker exec -it beautiful_wilson cat /var/jenkins_home/secrets/initialAdminPassword
> 7b92745ffb55478996224e52b1b716dd
- Access Jenkins through your web browser (default: http://localhost:8082)

Go to this web address and type in the Admin password from the above: eab3e6ccc05946198407e2ee129f62e8

- Set jenkins URL for remote users: http://localhost:8082/ 
Set username and password as you wish. (Refer to screenshot: )

  username: admin 
  password: 123

- Install the necessary plugins: Docker, Git, Docker Pipeline, Maven Intergration, pipeline maven integration, and GitHub Integration, Configuration as Code, Promethues, Sonarqube, .. (from project requirements), or as recommended on the comming page, then save the Jenkins URL by clicking the 'Save and Finish' button and 'Start using' button. 

Please refer to screenshot 4 and 5. 



- Create a New Pipeline Job:

In Jenkins, click on "New Item." on the upper left corner. (Refer to sceenshot 6)
Enter a name for your pipeline (eg. I put in: spring-petclinic-pipeline) and select "Pipeline."
Click "OK."

- Configure the Pipeline:

In the job configuration page, scroll down to the "Pipeline" section.
Choose "Pipeline script from SCM" for the "Definition" field.
Set "SCM" to "Git."
Enter the repository URL for your forked GitHub repo (e.g., https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git). 
Specify the branch to build (e.g., main).

Alternatively, choose  "Pipeline script ", copy paste Jenkinsfile into the script box. 

Then click 'Apply' and 'Save' at the bottom. 





- Check Jenkins Logs:

Access the Jenkins logs to identify any specific error messages or warnings that might indicate the cause of the issue. Logs are typically located in the Jenkins installation directory under logs.

run command: 
`docker logs <Jenkins-contianer-id>`

Output is long like this: 
> (base) qt@Quinns-MBP-2 FinalProject % docker logs 144cfc2d8875
> Running from: /usr/share/jenkins/jenkins.war
> webroot: /var/jenkins_home/war
> 2024-07-10 03:45:44.192+0000 [id=1]     INFO    winstone.Logger#logInternal: Beginning extraction from war file
> 2024-07-10 03:45:47.294+0000 [id=1]     WARNING o.e.j.s.handler.ContextHandler#setContextPath: Empty contextPath
> 2024-07-10 03:45:47.385+0000 [id=1]     INFO    org.eclipse.jetty.server.Server#doStart: jetty-10.0.20; built: 2024-01-29T20:46:45.278Z; git: 3a745c71c23682146f262b99f4ddc4c1bc41630c; jvm 17.0.11+9
> 2024-07-10 03:45:47.766+0000 [id=1]     INFO    o.e.j.w.StandardDescriptorProcessor#visitServlet: NO JSP Support for /, did not find org.eclipse.jetty.jsp.JettyJspServlet
> 2024-07-10 03:45:47.835+0000 [id=1]     INFO    o.e.j.s.s.DefaultSessionIdManager#doStart: Session workerName=node0
> 2024-07-10 03:45:48.816+0000 [id=1]     INFO    hudson.WebAppMain#contextInitialized: Jenkins home directory: /var/jenkins_home found at: EnvVars.masterEnvVars.get("JENKINS_HOME")
> 2024-07-10 03:45:49.098+0000 [id=1]     INFO    o.e.j.s.handler.ContextHandler#doStart: Started w.@161f6623{Jenkins v2.452.2,/,file:///var/jenkins_home/war/,AVAILABLE}{/var/jenkins_home/war}
> 2024-07-10 03:45:49.134+0000 [id=1]     INFO    o.e.j.server.AbstractConnector#doStart: Started ServerConnector@3a1dd365{HTTP/1.1, (http/1.1)}{0.0.0.0:8080}
> 2024-07-10 03:45:49.154+0000 [id=1]     INFO    org.eclipse.jetty.server.Server#doStart: Started Server@f001896{STARTING}[10.0.20,sto=0] @6441ms
> 2024-07-10 03:45:49.156+0000 [id=27]    INFO    winstone.Logger#logInternal: Winstone Servlet Engine running: controlPort=disabled
> 2024-07-10 03:45:49.558+0000 [id=35]    INFO    jenkins.InitReactorRunner$1#onAttained: Started initialization
> 2024-07-10 03:45:49.586+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: Listed all plugins
> 2024-07-10 03:45:51.041+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: Prepared all plugins
> 2024-07-10 03:45:51.047+0000 [id=39]    INFO    jenkins.InitReactorRunner$1#onAttained: Started all plugins
> 2024-07-10 03:45:51.058+0000 [id=38]    INFO    jenkins.InitReactorRunner$1#onAttained: Augmented all extensions
> 2024-07-10 03:45:51.370+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: System config loaded
> 2024-07-10 03:45:51.371+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: System config adapted
> 2024-07-10 03:45:51.372+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: Loaded all jobs
> 2024-07-10 03:45:51.375+0000 [id=45]    INFO    jenkins.InitReactorRunner$1#onAttained: Configuration for all jobs updated
> 2024-07-10 03:45:51.441+0000 [id=61]    INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
> 2024-07-10 03:45:52.241+0000 [id=47]    INFO    jenkins.install.SetupWizard#init: 
> *************************************************************
> *************************************************************
> *************************************************************
> Jenkins initial setup is required. An admin user has been created and a password generated.
> Please use the following password to proceed to installation:
> eab3e6ccc05946198407e2ee129f62e8
> This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
> *************************************************************
> *************************************************************
> *************************************************************
> 2024-07-10 03:46:11.772+0000 [id=47]    INFO    jenkins.InitReactorRunner$1#onAttained: Completed initialization
> 2024-07-10 03:46:11.798+0000 [id=26]    INFO    hudson.lifecycle.Lifecycle#onReady: Jenkins is fully up and running
> 2024-07-10 03:46:12.103+0000 [id=61]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
> 2024-07-10 03:46:12.103+0000 [id=61]    INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
> 2024-07-10 09:40:34.307+0000 [id=55]    INFO    hudson.model.AsyncPeriodicWork#doRun: Periodic background build discarder thread is still running. Execution aborted.
> 2024-07-10 18:47:01.035+0000 [id=15]    WARNING h.i.i.InstallUncaughtExceptionHandler#handleException
> java.lang.IllegalStateException: Response is committed

- restart Jenkins container so that all tools installed take effect
docker restart <docker-conainer-name>


- Configure Maven in Jenkins:

After installing the plugin, go back to Manage Jenkins > Global Tool Configuration.
Scroll down to Maven and click Add Maven.
Provide a name (e.g., "Maven") and configure the installation. You can either install automatically or specify an existing Maven installation path.

- find if port 8080 is in use inside jenkins container: 

> jenkins@e69bf1166ce6:/$ curl -I http://localhost:8080
> HTTP/1.1 403 Forbidden
> Date: Mon, 15 Jul 2024 03:27:04 GMT
> X-Content-Type-Options: nosniff
> Set-Cookie: JSESSIONID.c0ed36a3=node01ejb6mydlh0m31qxd1tlthhavf2.node0; Path=/; HttpOnly
> Expires: Thu, 01 Jan 1970 00:00:00 GMT
> Content-Type: text/html;charset=utf-8
> X-Hudson: 1.395
> X-Jenkins: 2.452.2
> X-Jenkins-Session: 56e9b666
> Transfer-Encoding: chunked
> Server: Jetty(10.0.20)


## 3. How to perform Jenkins automatic/continous build, test, run with SCM Polling Schedule


- Configure SCM Polling Schedule:

Go to your Jenkins dashboard and locate the pipeline you want to configure.
Click on the job to enter its configuration page.

Scroll down to the "Build Triggers" section in the job configuration.
Select the option for "Poll SCM" to enable SCM polling.
In the Schedule text box, enter the cron expression that specifies your desired schedule. For example:
put  "H/30 * * * *" into the scheduling box. This means your pipeline will rebuild every half an hour by schedule. 

Then you click 'apply' and 'save' button and restart Jenkins container to make this configuration effect. 


(Refer to screenshot: Jenkins pipeline config for Poll SCM Schedule. )


- Change petclinic code and commit the change to the forked git repo

You can change the original spring-petclinic website welcome message into "Welcome Group 4!" in its file: 'src/main/resources/messages/messages.properties' locally, and push the change into the public forked repo, or change the message on your git repo directly, then commit the change with a commit messsage "Update welcome message". 

The terminal output is like this: 

```
Run the commands and the output is: 

(base) qt@Quinns-MBP-2 spring-petclinic % git add src/main/resources/messages/messages.properties
git commit -m "Update welcome message"
git push origin main

[main fd1ef5f] Update welcome message
 1 file changed, 1 insertion(+), 1 deletion(-)

Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 8 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 638 bytes | 638.00 KiB/s, done.
Total 7 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To https://github.com/quintian/spring-petclinic.git
   6ae98b1..fd1ef5f  main -> main

```

Please refer to screenshot: "Commit a code change of messages in git repo". 


- Let the Jenkins pipeline automatically build, check its result and polling log.

Jenkins pipeline SCM Polling found a change in github web where the code is sourced (refer to screenshot: 'Polling log shows change found in git repo'), then the pipeline automatically built with this change (refer to sceenshot: 'Jenkins pipeline auto build when found change from githubweb'). 


When it's in the run stage, go to PetClinic website: https://localhost:8090. You should see the clinic web with an updated welcome message: "Welcome Group 4!". (In case the automatic deployment is not set)

If the automatic deployment is set in the Jenkinsfile, the website will be on automatically. 

( Refer to screenshot: 'Petclinic web up with updated welcome message'. )


You can also check the SCM polling log by the pipeline menu, as the sceenshot 'Jenkins pipeline polling log by SCM schedule'.

# (Instruction: fill the below 4 parts with the complete steps + output if necessary)

## 4. Configure with SonarQube 

- Install the Sonarqube Scanner (latest version) plugin in Jenkins-> Manage Jenkins -> Plugins.
- Also install Blue Ocean (latest version) plugin.
- Create a Sonarqube Scanner installation in Jenkins->Manage Jenkins->Tools. Check the install automatically box and get the latest version via 'Install from Maven Central'.
- While the sonarqube container is running, go to http://localhost:9000
- Log in with admin as username and password. Create a new password if prompted.
- In Sonarqube-> Administration->Security, generate a new token and save it somewhere.
- In a terminal, run ipconfig /all and make note of your IPV4 address.
- In Jenkins->Manage Jenkins-> System, Create a Sonarqube server. Check the use as environmental varuable box. For credentials, create a new secret text as your saved sonarqube token. For the server url use http://your IPV4:9000.
- Click 'Use Blue Ocean' to change the user interface for better visualization of the build process. You can restart each stage and view/download their logs seperately.
- Now if you run the project, the Sonarqube analysis stage in the Jenkinsfile will send the data to that server url and you can see the analysis results there. The project will be called petclinic.

```
stage('Static Analysis') {
          steps {
              script {
                   withSonarQubeEnv() {
                      sh './mvnw sonar:sonar'                   }
               }
           }
}
```
- The analysis will show you warnings about the security, mainatanability and reliability of the code in the spring petclinc project. Each aspect is graded on a letter scale and issues classified by impact, High, Medium and Low. We saw 16 high impact maintanability issues and one medium impact reliability issue. You can click on these categories to see a breakdown of the specific issues.
- Bear in mind that if the analysis has been done before and there is no new code in spring pet clinic, you will have to go to the 'Overall' tab instead of the default 'New Code' tab to see the whole result.

## 5. Configure with Prometheus and Grafana

- Go to jenkins in the browser (normally localhost:8080)
- Go to Manage Jenkins and under System Configuration click Plugins. Under Plugins in the left press Installed Plugins. Make sure you have Prometheus metrics plugin installed. If you don't you can install it from the Available Plugins.
- Go to Manage Jenkins and under System Configuration click System. Go down until you find Prometheus, you should see something like the screenshot jenkins-prometheus.png. If you don't then you probably didn't install Prometheus metrics plugin correctly.
- Enter the Prometheus docker with docker exec -it name_of_prometheus_container /bin/sh
- Connect Prometheus to Jenkins. cd to /etc/prometheus and add through vi or nano the following code to prometheus.yml

```
 - job_name: "jenkins"
     metrics_path: /prometheus
     static_configs:
     - targets: ["jenkins:8080"]
```
Make sure your yml has the correct identation.

- exit the prometheus container with exit
- Resetart the prometheus container with docker restart name_of_prometheus_container
- In the browser go to Grafana container (localhost:3000). Login using the user admin and the password admin.
- Click in Add Data Source, click on Prometheus. In Prometheus server URL * enter http://prometheus:9090. Refer to grafana_prometheus_datasource.png
- On the button Save & test. You should see a message saying 'Successfully queried the Prometheus API.' Refer to screenshot successful_message_datasource.png
- In Grafana (localhost:3000) click on the burger menu and then click in Dashboards.
- In Dashboard on the right top corner click on the blue button that says new. Click on New Dashboard.
- Click on Add Visualization. You will be prompted to select a data source. Select Prometheus.
- You should see the option to select a new visualization. Refer to screenshot grafana_new_ziz.png
- In Metric input you will see different Jenkins metrics. There, you can choose the metrics you want to display in the dashboard. For example, select jenkins_health_check_score. Then on the top right you should see time series, click there and change it for Stat. You should see something similar to screenshot jenkins_health_score.
- On the top right click on the blue Apply button. You should see something similar to screenshot initial_grafana_dashboard.png
- Click on the top right Add button to add a new visualization of the metric you prefer. We included:

> vm_memory_total_used
> default_jenkins_builds_last_build_duration_milliseconds
> jenkins_health_check_score
> jenkins_node_builds_count
> jenkins_runs_success_total
> jenkins_runs_aborted_total
> jenkins_queue_size_value
> jenkins_executor_free_value
> jenkins_executor_in_use_value
> vm_cpu_load You can see the finalized dashboard in final_grafana_dashboard.png


## 6. Configure with  Owasp Zap

- Add Docker, (Docker Commons and Coker API will be auto-installed by Jenkins) and Docker Pipeline plugin
    -> After downloading plugin, must add it as a tool named "docker"
- Add Maven installation
- Add Github credentials
- After reinstalling, must restart Jenkins. (this takes a long time.)
- Create pipeline (copy/paste Jenkinsfile)


NOTE: Do NOT put a space into the name of a test in Jenkins

Docker Images used:

Th way that is working (sort of):
had to manually start the docker daemon: 
sudo service docker start 
after restarting the container. Should probably add this as an ENTRYPOINT or CMD in the image.

## 7. Deployemnt with Ansible


# Text Capture

## - 1. Use Docker to set up containers for Jenkins, SonarQube, Prometheus, Grafana, and OWASP ZAP.

run command: 

`docker-compose ps
`
Output: 

> (base) qt@Quinns-MBP-2 FinalProject % docker-compose ps
>           Name                         Command                   State                      Ports              
> ---------------------------------------------------------------------------------------------------------------
> finalproject_grafana_1      /run.sh                          Up               0.0.0.0:3000->3000/tcp           
> finalproject_jenkins_1      /usr/bin/tini -- /usr/loca ...   Up               50000/tcp, 0.0.0.0:8080->8080/tcp
> finalproject_owaspzap_1     /home/zap/init.sh                Up (unhealthy)   0.0.0.0:8081->8080/tcp, 8090/tcp 
> finalproject_prometheus_1   /bin/prometheus --config.f ...   Up               0.0.0.0:9090->9090/tcp           
> finalproject_sonarqube_1    /opt/sonarqube/docker/entr ...   Up               0.0.0.0:9000->9000/tcp 

Please refer to screenshot: 'docker-compose up 5 contianers', and 'contianers are up running

## - 2. Fork the project repository on GitHub/GitLab and clone it to your local machine.

- Create a 'FinalProject' folder in your local machine and cd to this folder
- fork the project: https://github.com/quintian/spring-petclinic.git, and clone to in FinalProject folder

`git clone https://github.com/quintian/spring-petclinic.git
`

Output: 

> (base) qt@Quinns-MBP-2 FinalProject % git clone https://github.com/quintian/spring-petclinic.git
> Cloning into 'spring-petclinic'...
> remote: Enumerating objects: 9967, done.
> remote: Total 9967 (delta 0), reused 0 (delta 0), pack-reused 9967
> Receiving objects: 100% (9967/9967), 7.55 MiB | 7.42 MiB/s, done.
> Resolving deltas: 100% (3762/3762), done.

## - 3. Create a custom Docker network to connect all the services.
## - 4. Run Jenkins in a Docker container connected to the custom network.
## - 5. Run SonarQube in a Docker container connected to the custom network.
## - 6. Run Prometheus in a Docker container connected to the custom network.
## - 7. Run Grafana in a Docker container connected to the custom network.
## - 8. Run OWASP ZAP in a Docker container connected to the custom network.

For requirement 3-8, please refer to screenshot: 'network inspect - details'. 

## - 9. Create a Jenkins pipeline that uses the forked GitHub repository.

Please refer to screenshot 4-11
## - 10. Set up build triggers to poll Source Control Management (SCM).

Please refer to screenshot 12. Jenkins pipeline conffig for Poll SCM Schedule.png. 

## - 11. Create and invoke build steps for the spring-petclinic project.

Pleae refer to screenshot 13-17 for the automatic build output of the Jenkins pipeline


- Configure SCM Polling Schedule:

Go to your Jenkins dashboard and locate the pipeline you want to configure.
Click on the job to enter its configuration page.

Scroll down to the "Build Triggers" section in the job configuration.
Select the option for "Poll SCM" to enable SCM polling.
In the Schedule text box, enter the cron expression that specifies your desired schedule. For example:
put  "H/5 * * * *" into the scheduling box. This means your pipeline will rebuild every half an hour by schedule. 

Then you click 'apply' and 'save' button and restart Jenkins container to make this configuration effect. 


(Refer to screenshot: Jenkins pipeline config for Poll SCM Schedule. )


- Change petclinic code and commit the change to the forked git repo

You can change the original spring-petclinic website welcome message into "Welcome Group 4!" in its file: 'src/main/resources/messages/messages.properties' locally, and push the change into the public forked repo, or change the message on your git repo directly, then commit the change with a commit messsage "Update welcome message". 

The terminal output is like this: 

```
Run the commands and the output is: 

(base) qt@Quinns-MBP-2 spring-petclinic % git add src/main/resources/messages/messages.properties
git commit -m "Update welcome message"
git push origin main

[main fd1ef5f] Update welcome message
 1 file changed, 1 insertion(+), 1 deletion(-)

Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 8 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 638 bytes | 638.00 KiB/s, done.
Total 7 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To https://github.com/quintian/spring-petclinic.git
   6ae98b1..fd1ef5f  main -> main

```
Please refer to screenshot: "Commit a code change of messages in git repo". 

- Let the Jenkins pipeline automatically build, check its result and polling log.

Jenkins pipeline SCM Polling found a change in github web where the code is sourced (refer to screenshot: 'Polling log shows change found in git repo'), then the pipeline automatically built with this change (refer to sceenshot: 'Jenkins pipeline auto build when found change from githubweb'). 

When it's in the run stage, go to PetClinic website: https://localhost:8090. You should see the clinic web with an updated welcome message: "Welcome Group 4!". 

If the automatic deployment is set in the Jenkinsfile, the website will be on automatically. 

( Refer to screenshot: 'Petclinic web up with updated welcome message'. )

You can also check the SCM polling log by the pipeline menu, as the sceenshot 'Jenkins pipeline polling log by SCM schedule'.



#   (Instruction: fill the below parts with text dump or screenshots for the outputs of main steps.  ) 

## - 12. Configure SonarQube to perform static analysis for the project. Use the Blue Ocean plugin to visualize the build process.

## - 13. Execute OWASP ZAP with appropriate configuration.

## - 14. Add post-build actions to publish HTML reports for OWASP ZAP.
## - 14. Install the Prometheus plugin in Jenkins.
## - 16. Configure the Prometheus plugin to monitor Jenkins.
## - 17. Configure Grafana to use Prometheus as a data source and create dashboards to visualize Jenkins metrics.
## - 18. Set up a Virtual Machine (VM) to act as the production web server.
## - 19. Use Ansible on the Jenkins build server to deploy the spring-petclinic application to the production web server (VM).
## - 20. Ensure the application is deployed and running on the production web server (VM) by showing the welcome screen.




## - 21. Make and push a code change to the GitHub repository.

Please refer to screenshot 13. Commit a code change of messages in git repo.

## - 22. Verify Jenkins automatically builds, tests, and deploys the new version, and the content change is reflected in the deployed application.

Please refer to screenshots:
14. Plling log shows change found in git repo
15. Jenkins pipleline autobuild when found change from githubweb
16. Petclinic web up with updated welcome message
17. check Jenkins pipeline build history

# Journal


