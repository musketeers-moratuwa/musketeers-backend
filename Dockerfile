FROM eclipse-temurin:17-jdk AS build

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Build the application using javac
RUN javac main.java

# Create the Manifest file (fixing potential format issues)
RUN printf "Main-Class: main\n\n" > MANIFEST.MF

# Package into a JAR file
RUN jar cfm main.jar MANIFEST.MF main.class

# Use a lightweight JDK image for the runtime
FROM openjdk:8-jdk-alpine

WORKDIR /app
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS

# Copy the built JAR file from the build stage
COPY --from=build /app/main.jar app.jar

# Expose the application port
EXPOSE 3000

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
