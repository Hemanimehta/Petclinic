FROM openjdk:8-jdk-alpine AS builder
WORKDIR /app

COPY pom.xml .
RUN mvn clean package

FROM openjdk:8-jdk-alpine
COPY --from=builder /app/target/petclinic.war /app/petclinic.war
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "/app/petclinic.war"]
