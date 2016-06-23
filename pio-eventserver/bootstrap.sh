#!/bin/bash

env.sh
wait.sh -t 30 $HBASE_MASTER_HOST:$ZOOKEEPER_PORT 
wait.sh -t 30 $ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT
echo "Sleeping another $SLEEP seconds to make sure the Zookeeper fully started..." 
sleep $SLEEP
pio eventserver 