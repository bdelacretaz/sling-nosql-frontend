#!/bin/bash -e
# Library of common functions to create Sling configs via HTTP

SLING=http://sling:8080

function POST {
    http -v --ignore-stdin --auth=admin:admin -f POST $SLING"$@"
}

function create_osgi_config {
	POST "/system/console/configMgr/[Temporary PID replaced by real PID upon save]" \
	  apply=true \
	  action=ajaxConfigManager \
	  location= \
	  "$@"
}

# TODO move those to their own files
function create_fsprovider_config {
	create_osgi_config \
		factoryPid=org.apache.sling.fsprovider.internal.FsResourceProvider \
		provider.roots=/content/blog/images \
		provider.file=../src/main/resources \
		provider.checkInterval=1000 \
		propertylist=provider.roots,provider.file,provider.checkinterval
}

function create_couchbase_config {
	# Couchbase provider
	create_osgi_config \
		factoryPid=org.apache.sling.nosql.couchbase.resourceprovider.CouchbaseNoSqlResourceProviderFactory.factory.config \
		provider.roots=/content/blog/posts \
		cacheKeyPrefix=sling-resource: \
		propertylist=cacheKeyPrefix,provider.roots
}