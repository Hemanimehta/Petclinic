# Stage 1: Build the application
FROM maven:3.8.5-openjdk-11-slim AS builder
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml ./
COPY src ./src

# Package the application
RUN mvn clean package

# Stage 2: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/petclinic.war ./
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "petclinic.war"]
