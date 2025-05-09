# Use an official Maven image to build the application. 
# This image includes JDK 17 by default.
FROM maven:3.9-eclipse-temurin-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the application code
COPY src ./src

# Package the application
RUN mvn package -DskipTests

# Use a slim JDK image for the runtime environment
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the application port (as per README and application.properties)
EXPOSE 8081

# Set the entrypoint to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
