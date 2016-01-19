# Sling/NoSQL frontend demo cheatsheet
Links and commands used for the demo.

## Docker compose
	docker rm $(docker ps -q -a)
	docker-machine start default
	eval $(docker-machine env default)
    
    docker-compose --x-networking up -d sling mongo redis
	
	# set dockerhost to point to...your dockerhost
	open http://dockerhost:8080/bin/browser.html
	
And in a different console

    docker-compose --x-networking up dbwatcher
	
And later

    docker-compose --x-networking up -d mongo2
    docker-compose --x-networking up -d mongo3

## Curl commands
    curl -u admin:admin -Ftitle=bonjour http://dockerhost:8080/nosql/static-mounts/mongo/testing
	curl -u admin:admin http://dockerhost:8080/nosql/static-mounts/mongo.tidy.2.json


## Redis client
    docker run --net docker -it redis:3.0.6 bash

    redis-cli -h redis ZADD sling:stats 10 .nosql.static-mounts.redis.testing_$(date +%s)
	
## Mongo client
	docker run --net docker -it mongo:3.0 bash
	
	http://dockerhost:8080/system/console/status-Configurations

	db.resources.insert({ "_id" : "/nosql/static-mounts/mongo/demoA", "data" : { "text" : "mongo static here" }, "parentPath" : "/nosql/static-mounts/mongo" })
	
	db.resources.insert({ "_id" : "/nosql/mount/mongo_deux/demoB", "data" : { "text" : "mongo deux here" }, "parentPath" : "/nosql/mount/mongo_deux" })

	db.resources.insert({ "_id" : "/nosql/mount/mongo_trois/demoC", "data" : { "text" : "mongo trois here" }, "parentPath" : "/nosql/mount/mongo_trois" })

    curl -u admin:admin http://dockerhost:8080/nosql/mount/mongo_deux.tidy.3.json
		
    curl -u admin:admin http://dockerhost:8080/nosql/mount/mongo_trois.tidy.3.json