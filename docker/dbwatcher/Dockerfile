# Dockerfile for our dbwatcher container - listens to Docker events
# and creates the corresponding Sling configs to mount databases

# Use java:8 base as we're using that image elsewhere
FROM java:8

# Need a recent docker client, apt-get provides old 1.6.2
RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 && chmod +x docker-1.9.1 && mv docker-1.9.1 /usr/local/bin/docker
 
RUN apt-get update && \
    apt-get install -y httpie && \
	apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/*

COPY fsroot /
CMD /bin/bash /scripts/docker_watcher.sh