# Stage 1: Build the application
FROM maven:3.8.4 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]