# select parent image
FROM maven:3.6.3-jdk-8
EXPOSE 8080
# copy the source tree and the pom.xml to our new container
COPY ./ ./
# package our application code
#RUN mvn clean package
RUN mvn clean install -Dv=${BUILD_NUMBER}
# set the startup command to execute the jar
CMD ["java", "-jar", "target/spring-boot-docker.jar"]
