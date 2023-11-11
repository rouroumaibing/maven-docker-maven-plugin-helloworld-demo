#!/bin/bash
TAG=${1:-3.9.5}

#install java
yum install -y java java-devel docker

#install maven
wget https://dlcdn.apache.org/maven/maven-3/${TAG}/binaries/apache-maven-${TAG}-bin.tar.gz

tar -zxvf apache-maven-${TAG}-bin.tar.gz -C /usr/local/

MAVEN_HOME=/usr/local/apache-maven-${TAG}
echo "export MAVEN_HOME=/usr/local/apache-maven-${TAG}" >> /etc/profile
echo "export PATH=$MAVEN_HOME/bin:\$PATH" >> /etc/profile
source /etc/profile

mvn -v