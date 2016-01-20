# Sling/NoSQL frontend demo scenario / cheatsheet

## Intro
System description, show JSON output.

Show and explain docker-compose.yml.

## Docker cleanup and start containers
    docker-machine start default
    eval $(docker-machine env default)
    docker rm $(docker ps -q -a)
	
Set dockerhost in /etc/hosts	

    docker-compose --x-networking up -d mongo redis
    docker-compose --x-networking up -d sling

Open (in safari) http://dockerhost:8080/nosql.tidy.9.json

Or use

    while true ; do curl http://dockerhost:8080/nosql.tidy.9.json ; sleep 1 ; clear ; done

## demo 0: planets
Create a second planets config, explain config factories.

Disable the planets components, show the effect on JSON.

Slide: planets source code.

## demo 1: show json output, add mongo and redis data

Use rput, m1, m2, m3 and hpost history commands

    docker run --net docker -it docker_uniclient
	
Also show Composum explorer at http://dockerhost:8080/bin/browser.html/nosql	

## demo 2: dynamic mounts
docker-compose --x-networking up dbwatcher

docker-compose --x-networking up -d mongo2

show dbwatcher console, then safari json