# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvn pom.xml ./
RUN sudo apt install maven -y
RUN ./mvnw dependency:list

COPY src ./src

CMD ["./mvn", "spring-boot:run"]
