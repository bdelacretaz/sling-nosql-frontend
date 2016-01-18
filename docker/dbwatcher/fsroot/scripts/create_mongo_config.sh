#!/bin/bash -e
# Create Sling config for a MongoDB mount

MYFOLDER=$(dirname $0)
. $MYFOLDER/config_lib.sh

HOST=$1
PORT=$2
MOUNT_PATH=$3
CS=$HOST:$PORT
echo Creating Sling config to mount Mongo DB $CS at $MOUNT_PATH
	
create_osgi_config \
	factoryPid=org.apache.sling.nosql.mongodb.resourceprovider.MongoDBNoSqlResourceProviderFactory.factory.config \
	provider.roots=$MOUNT_PATH \
	connectionString=$HOST:$PORT \
	database=sling \
	collection=resources \
	propertylist=provider.roots,connectionString,database,collection
