
# question
 - the config done on Jenkins web shall be automated by code? yes for automation

You need to do:
- jenkins if check out gitlink?
- once build done, what artifacts are created?
- 
# Tooling

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

- Create configuration files for grafana as finalproject/grafana.ini
```
[server]
; TBD: Explore http vs https
protocol = http
http_port = 3000
domain = localhost
root_url = %(protocol)s://%(domain)s:%(http_port)s/
serve_from_sub_path = false

[security]
; TBD: This may be removed once SSH is setup
admin_user = admin
admin_password = admin
```
- Create configuration files for promethues as finalproject/prometheus.yml
```
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'jenkins'
    static_configs:
      - targets: ['jenkins:8080']

  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```
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
      - "8080:8080"
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

> (base) qt@Quinns-MBP-2 FinalProject % docker exec finalproject_jenkins_1  cat /var/jenkins_home/secrets/initialAdminPassword
> eab3e6ccc05946198407e2ee129f62e8

- Access Jenkins through your web browser (default: http://localhost:8080)

Go to this web address and type in the Admin password from the above: eab3e6ccc05946198407e2ee129f62e8

- Install the necessary plugins: Docker, Git, Pipeline, and GitHub Integration, Promethues, Sonarqube, .. (from project requirements), or as recommended on the comming page, then save the Jenkins URL by clicking the 'Save and Finish' button and 'Start using' button. 

Please refer to screenshot 4 and 5. 

- Create a New Pipeline Job:

In Jenkins, click on "New Item." on the upper left corner. (Refer to sceenshot 6)
Enter a name for your pipeline (eg. I put in: spring-petclinic-pipeline) and select "Pipeline."
Click "OK."

- Configure the Pipeline:

In the job configuration page, scroll down to the "Pipeline" section.
Choose "Pipeline script from SCM" for the "Definition" field.
Set "SCM" to "Git."
Enter the repository URL for your forked GitHub repo (e.g., https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git). For our case, this repo link shall be: https://github.com/quintian/DevOps-FinalProject/spring-petclinic.git
Specify the branch to build (e.g., main).

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

