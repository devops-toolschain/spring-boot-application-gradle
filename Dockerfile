# Application image

FROM openjdk:11-jdk-slim

#COPY lib/AI-Agent.xml /opt/app/
#COPY build/libs/spring-boot-app.jar /opt/app/

COPY artifactOutput/spring-boot-app.jar /opt/app/

EXPOSE 4550
CMD [ "spring-boot-app.jar" ]
