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