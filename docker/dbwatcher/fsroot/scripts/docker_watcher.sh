#!/bin/bash -e
# Watch for docker start events and create Sling database mount
# configs for matching events

ME=$0
MYFOLDER=$(dirname $ME)

function dequote() {
	 sed 's/[\"]//g'
}

echo "$ME starting"
echo "Don't forget to run docker-compose with the --x-networking option"
echo "Here's /etc/hosts, it should contain a "sling" host:"
cat /etc/hosts

docker events -f event=start | grep --line-buffered start | sed -u 's/[^ ]*//' | sed -u 's/:.*//' | while read ID
do 
    # with recent docker clients we could use docker ps --format for this, but
	# that might not provide everything we need
	TMPF=$(mktemp /tmp/$(basename $ME).XXXXXX)
	docker inspect $ID > $TMPF
	DBTYPE=$(jq '.[0].Config.Labels["ch.x42.slingdb.type"]' < $TMPF | dequote)
	HOST=$(jq .[0].NetworkSettings.Networks.docker.IPAddress < $TMPF | dequote)
	PORT=$(jq '.[0].Config.Labels["ch.x42.slingdb.port"]' < $TMPF | dequote)
	NAME=$(jq .[0].Name < $TMPF | sed 's/[^a-zA-Z0-9_]//g')
	rm $TMPF
	
	if [[ -z "$DBTYPE" || "$DBTYPE" = "null" ]]
	then
		echo "Container $ID started, no DB type label provided, ignored"
	else
		CMD="create_${DBTYPE}_config.sh $HOST $PORT /nosql/mount/$NAME"
		echo "Container $ID started, running $CMD"
		${MYFOLDER}/${CMD} < /dev/null
	fi
done