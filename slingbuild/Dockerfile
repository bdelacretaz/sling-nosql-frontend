# Dockerfile for our Sling demo launchpad runnable jar
# Build with 
#	docker build -t sling-nosql-demo .
# That jar must be built first, using Maven
FROM java:8
COPY sling-nosql-demo-launchpad/target/sling-nosql-demo-launchpad-0.0.1-SNAPSHOT.jar /opt/sling/demo-launchpad.jar
WORKDIR /opt/sling/

# HTTP and debugging ports
EXPOSE 8080
EXPOSE 30303

# Without and with JVM debugger
#ENV JAVA_OPTS -Xmx512m
ENV JAVA_OPTS -Xmx512m  -XX:MaxPermSize=128m -agentlib:jdwp=transport=dt_socket,address=30303,server=y,suspend=n

ENV SLING_OPTS ''
CMD exec java $JAVA_OPTS -jar demo-launchpad.jar $SLING_OPTS
