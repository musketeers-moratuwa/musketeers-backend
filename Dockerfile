FROM eclipse-temurin:17-jdk AS build

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Build the application using Maven
# RUN ./mvn clean package -DskipTests
RUN javac main.java

# Use a lightweight JDK image for the runtime
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/*.java app.jar

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
