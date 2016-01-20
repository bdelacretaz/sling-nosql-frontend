# Sling/NoSQL frontend demo scenario / cheatsheet

## Prep: Docker cleanup and start containers
    docker-machine start default
    eval $(docker-machine env default)
    docker rm $(docker ps -q -a)
	
Set dockerhost in /etc/hosts	

## Intro: What are we building?
System description, show JSON output.

Show and explain docker-compose.yml.

## demo: Start initial containers
    docker-compose --x-networking up -d mongo redis
    docker-compose --x-networking up -d sling

Open (in safari) http://dockerhost:8080/nosql.tidy.9.json

Or use

    while true ; do curl http://dockerhost:8080/nosql.tidy.9.json ; sleep 1 ; clear ; done

## demo 0: planets
Start with no planets.

Open http://dockerhost:8080/system/console/configMgr

Create the planets config, show the JSON output.

Create a second planets config.

Disable the planets components, show the effect on JSON.

Slide: planets source code.

Disable the planets components at http://dockerhost:8080/system/console/components

## demo 1: show json output, add mongo and redis data

    docker run --net docker -it docker_uniclient
	
Use rput, m1, m2, m3 and hpost history commands

## how does it work?
Slides: ResourceProvider, configuration factories

## demo 2: dynamic mounts
    docker-compose --x-networking up dbwatcher

    docker-compose --x-networking up -d mongo2

show the new mongo_deux config at http://dockerhost:8080/system/console/status-Configurations

show dbwatcher console, then safari json

    docker-compose --x-networking up -d mongo3
	
show safari json

Explain how Sling could render all this in various formats.


## describe the dbwatcher
Show labels in docker-compose.yml

Slide: watcher script source code

## conclusion
The ResourceProvider rocks!	

The dynamics of Docker containers and OSGi configs allow for automatic configuration.

