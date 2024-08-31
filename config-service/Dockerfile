# Start with a base image containing Java runtime
FROM openjdk:21-jdk-slim

# Add a volume pointing to /tmp (useful for some applications to write temporary files)
VOLUME /tmp

# The application's jar file
ARG JAR_FILE=target/*.jar

# Copy the application's jar file to the container
COPY ${JAR_FILE} /app.jar

# Set the working directory to /
WORKDIR /

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app.jar"]
