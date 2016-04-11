#!/bin/bash

sed -i "s/@HDFS_HOST@/$HDFS_HOST/g" $HBASE_HOME/conf/hbase-site.xml
sed -i "s/@HDFS_PORT@/$HDFS_PORT/g" $HBASE_HOME/conf/hbase-site.xml

IP=`ip addr show eth0 | grep 'inet ' | cut -d/ -f1 | awk '{print $2}'`
sed -i "s/@IP@/$IP/g" $HBASE_HOME/conf/hbase-site.xml

echo "$IP" >> "$HBASE_HOME/conf/regionservers"
echo "$IP" >> "$HBASE_HOME/conf/backup-master"

/usr/sbin/sshd && start-hbase.sh
