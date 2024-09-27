FROM maven:3.6.3-jdk-8-alpine AS builder
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package
FROM openjdk:8-jdk-alpine
COPY --from=builder /app/target/petclinic.war /app/petclinic.war
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "/app/petclinic.war"]
