#!/bin/bash
WORKDIR=`pwd`

#init helloworld project
GROUPID=helloworld
ARTIFACTID=helloworld
VERSION=1.0.0
DOCKER_HOST=unix:///var/run/docker.sock 

echo | mvn archetype:generate -DgroupId=${GROUPID} -DartifactId=${ARTIFACTID} -Dpackage=${GROUPID} -Dversion=${VERSION} 

mkdir -p ${ARTIFACTID}/src/main/docker

cp -rf pom.bak  ${ARTIFACTID}/pom.xml

cat > ${ARTIFACTID}/src/main/docker/Dockerfile <<EOF
FROM openjdk:jre
COPY target/\${project.build.finalName}.jar /app.jar
CMD ["java","-jar","/app.jar"]
EOF

cd ${GROUPID}
mvn clean package docker:build 
mvn -Ddocker.username=xxx -Ddocker.password=xxxx docker:push
cd -
