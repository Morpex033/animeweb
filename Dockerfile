FROM openjdk:19-jdk-slim AS build

COPY . /java
WORKDIR /java

RUN ./mvnw clean package

FROM openjdk:19-jdk-slim

COPY --from=build /java/target/animeweb.jar /app/animeweb.jar

WORKDIR /app

EXPOSE 80

CMD ["java", "-jar", "animeweb.jar"]
