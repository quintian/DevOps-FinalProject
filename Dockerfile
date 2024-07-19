# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && \
#     apt-get install -y openjdk-17-jdk && \
#     apt-get clean

# ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
# ENV PATH=$JAVA_HOME/bin:$PATH

# USER jenkins

FROM jenkins/jenkins:lts

USER root

# Install prerequisites
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# Install Docker
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
#     && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
#     && apt-get update \
#     && apt-get install -y docker-ce docker-ce-cli containerd.io


# Install OpenJDK 17
RUN apt-get install -y openjdk-17-jdk

# Install Maven
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG /root/.m2
ENV PATH $MAVEN_HOME/bin:$PATH
RUN apt-get install -y maven

# Install Git
RUN apt-get install -y git

# Switch back to Jenkins user
USER jenkins