# POST test data to check that it goes in the right places

ID=$(date +%s)
HOST=dockerhost
R=test-$ID
M=http://$HOST:8080/nosql/static-mounts

curl -u admin:admin -F text="$ID into Sling itself" http://dockerhost:8080/tmp/$R

curl -u admin:admin -F text="$ID into Mongo" $M/mongo/$R

curl -u admin:admin -F text="$ID into Couchbase" $M/couchbase/$R

curl -u admin:admin -F text="$ID into Redis" $M/redis/$R

# TODO is the redis provider read-only? POST does not seem to add data
# redis-cli ZINCRBY sling:stats 100 .nosql.static-mounts.redis.slingdemo

echo
echo "Contents of $M"
curl -u admin:admin http://dockerhost:8080/nosql/static-mounts.tidy.5.json ; echo
