#!/bin/bash -e
# Watch for docker start events and create Sling database mount
# configs for matching events

MYFOLDER=$(dirname $0)

docker events -f event=start | grep --line-buffered start | sed -l 's/[^ ]*//' | sed -l 's/:.*//' | while read ID
do 
	DBTYPE=$(docker ps -f=id=$ID --format '{{.Label "ch.x42.slingdb.type"}}')
	HOST=$(docker inspect $ID | grep 'Hostname":' | cut -d'"' -f4)
	PORT=$(docker ps -f=id=$ID --format '{{.Ports}}' | head -1 | cut -d: -f2 | cut -d- -f1)
	if [[ -z "$DBTYPE" ]]
	then
		echo "Container $ID started, no DB type label provided, ignored"
	else
		CMD="create_${DBTYPE}_config.sh $HOST $PORT host-$HOST"
		echo "Container $ID started, running $CMD"
		${MYFOLDER}/${CMD} < /dev/null
	fi
done