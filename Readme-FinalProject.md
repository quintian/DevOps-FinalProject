


# Steps

<<<<<<< HEAD
=======
## 1. Initial setup network and 5 contianers 

>>>>>>> 89b6f5a (Removed spring-petclinic submodule)
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
<<<<<<< HEAD
=======

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

- Install the necessary plugins: Git, Pipeline, and GitHub Integration, or as recommended on the comming page, then save the Jenkins URL by clicking the 'Save and Finish' button and 'Start using' button. 

Please refer to screenshot 4 and 5. 

- Create a New Pipeline Job:

In Jenkins, click on "New Item." on the upper left corner. (Refer to sceenshot 6)
Enter a name for your pipeline (eg. I put in: spring-petclinic-pipeline) and select "Pipeline."
Click "OK."

>>>>>>> 89b6f5a (Removed spring-petclinic submodule)
