#FROM openjdk:8-jdk-alpine
#ARG JAR_FILE=target/*.war
#COPY ${JAR_FILE} app.war
#ENTRYPOINT ["java","-jar","/app.war"]

#base image
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

#copy .mvn(dir), mvnw(file), pom.xml(file) to the container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

#add executable permission to the maven wrapper file
RUN chmod +x ./mvnw

# search for dos2unix , then you will get some idea on this line
#( in simple term - this line download dos2unix command utility to our container during build)
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix ./mvnw

#This line will add the project dependency in the container during the build
RUN ./mvnw dependency:resolve

COPY src ./src
CMD ["./mvnw", "spring-boot:run"]