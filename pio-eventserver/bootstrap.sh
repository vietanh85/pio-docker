#!/bin/bash

env.sh
# wait.sh $HBASE_HOST:$ZOOKEEPER_PORT
echo "sleeping $SLEEP seconds ..." 
sleep $SLEEP
pio eventserver