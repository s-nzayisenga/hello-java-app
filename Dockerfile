# Use the official OpenJDK image as the base image
FROM amazoncorretto:17-alpine3.17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY build/libs/keda-newrelic-app-0.0.1-SNAPSHOT.jar hello-app.jar

# Expose the port that the application will run on
EXPOSE 8080

#Add New Relic artifacts
#Add both ./newrelic/newrelic.jar and ./newrelic/newrelic.yml to your Dockerfile.
# RUN mkdir -p /usr/local/newrelic
# ADD ./newrelic/newrelic.jar /usr/local/newrelic/newrelic.jar
# ADD ./newrelic/newrelic.yml /usr/local/newrelic/newrelic.yml

#Update the command that launches your Java application to include Java's built-in -javaagent argument. 
#This argument must reference the container's location of newrelic.jar.
# Specify the command to run on container startup
#CMD ["java", "-javaagent:/usr/local/newrelic/newrelic.jar","-jar", "hello-app.jar"]

CMD ["java", "-jar", "hello-app.jar"]

