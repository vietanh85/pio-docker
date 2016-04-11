#!/bin/bash

sed -i "s/@HBASE_MASTER_HOST@/$HBASE_MASTER_HOST/g" $HBASE_CONF_DIR/hbase-site.xml \
   && sed -i "s/@HBASE_MASTER_PORT@/$HBASE_MASTER_PORT/g" $HBASE_CONF_DIR/hbase-site.xml \
   && sed -i "s/@REGION_SERVER_PORT@/$REGION_SERVER_PORT/g" $HBASE_CONF_DIR/hbase-site.xml \
   && sed -i "s/@HDFS_HOST@/$HDFS_HOST/g" $HBASE_CONF_DIR/core-site.xml \
   && sed -i "s/@HDFS_PORT@/$HDFS_PORT/g" $HBASE_CONF_DIR/core-site.xml \
   && sed -i "s/@ZOOKEEPER_HOST@/$ZOOKEEPER_HOST/g" $HBASE_CONF_DIR/hbase-site.xml \
   && sed -i "s/@ZOOKEEPER_PORT@/$ZOOKEEPER_PORT/g" $HBASE_CONF_DIR/hbase-site.xml \
   && sed -i "s/@ELASTICSEARCH_HOST@/$ELASTICSEARCH_HOST/g" $HBASE_CONF_DIR/pio-env.sh \
   && sed -i "s/@ELASTICSEARCH_PORT@/$ELASTICSEARCH_PORT/g" $HBASE_CONF_DIR/pio-env.sh \
   && sed -i "s/@ELASTICSEARCH_CLUSTERNAME@/$ELASTICSEARCH_CLUSTERNAME/g" $HBASE_CONF_DIR/pio-env.sh

echo "$HBASE_MASTER_IP $HBASE_MASTER_HOST" >> "/etc/hosts"

