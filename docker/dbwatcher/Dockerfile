# Dockerfile for our dbwatcher container - listens to Docker events
# and creates the corresponding Sling configs to mount databases

# Use java:8 base as we're using that image elsewhere
FROM java:8

# For now we use -v to mount the docker client instead of
#    apt-get install -y docker.io && \
RUN apt-get update && \
    apt-get install -y httpie && \
    rm -rf /var/lib/apt/lists/*

COPY fsroot /
CMD /bin/bash /scripts/docker_watcher.sh