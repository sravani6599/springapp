# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN sudo apt install maven -y
RUN ./mvnw dependency:list

COPY src ./src

CMD ["./mvnw", "spring-boot:run"]
