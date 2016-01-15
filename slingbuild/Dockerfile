# Dockerfile for our Sling demo launchpad runnable jar
# Build with 
#	docker build 
# That jar must be built first, using Maven
FROM java:8
COPY sling-nosql-demo-launchpad/target/sling-nosql-demo-launchpad-0.0.1-SNAPSHOT.jar /opt/sling/demo-launchpad.jar
WORKDIR /opt/sling/
EXPOSE 8080
ENV JAVA_OPTS -Xmx512m
ENV SLING_OPTS ''
CMD exec java $JAVA_OPTS -jar demo-launchpad.jar $SLING_OPTS