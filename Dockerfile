#Taking the base image to work on
FROM openjdk:8-jdk
#installation and updation 
RUN apt-get update && apt-get install -y maven
#copying code from project to dockerfile
COPY src /src
COPY pom.xml /pom.xml
#to build the project we used maven : which is (Project Management tool)
RUN mvn clean package -DskipTests
#To run the jar
ENTRYPOINT ["java","-jar","target/App.war"]
#port
EXPOSE 8080
