


# Steps

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
