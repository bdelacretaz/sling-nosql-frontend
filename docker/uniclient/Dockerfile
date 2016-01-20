# Dockerfile for our uniclient ("universal client") container, meant 
# to be used interactively to add data to our NoSQL databases and to
# Sling via HTTP.

# Start from a mongo image which has the mongo client and curl
FROM mongo:3.0

# Add Redis client
RUN echo deb http://ftp.us.debian.org/debian wheezy-backports main > /etc/apt/sources.list.d/wheezy-backports.list && \
    apt-get update -y && \
    apt-get  -t wheezy-backports install -y redis-tools && \
    rm -rf /var/lib/apt/lists/*

# Add our glue scripts
COPY fsroot /
RUN chmod +x /scripts/*

WORKDIR /scripts
CMD /bin/bash