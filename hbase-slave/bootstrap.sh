#!/bin/bash

sed -i "s/@HDFS_HOST@/$HDFS_HOST/g" $HBASE_HOME/conf/hbase-site.xml
sed -i "s/@HDFS_PORT@/$HDFS_PORT/g" $HBASE_HOME/conf/hbase-site.xml

sed -i "s/@IP@/$MASTER_IP/g" $HBASE_HOME/conf/hbase-site.xml

echo "$MASTER_IP" >> "$HBASE_HOME/conf/regionservers"
echo "$MASTER_IP" >> "$HBASE_HOME/conf/backup-master"

echo "$MASTER_IP $MASTER_HOST" >> "/etc/hosts"

/usr/sbin/sshd && start-hbase.sh