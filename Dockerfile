FROM openjdk:8
EXPOSE 8082
COPY target/spring-framework-petclinic-2.2.0.RELEASE.war petclinic.war
ENTRYPOINT ["java", "-jar", "/petclinic.war"]
