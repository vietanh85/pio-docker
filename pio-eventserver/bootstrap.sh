#!/bin/bash

env.sh
wait.sh $HBASE_MASTER_IP:$ZOOKEEPER_PORT 
wait.sh $ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT
echo "Sleeping another $SLEEP seconds to make sure the Zookeeper fully started..." 
sleep $SLEEP
pio eventserver 