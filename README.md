# pio-docker
PredictionIO stacks in Docker

`docker run -d -p 9000:9000 vietanh85/hdfs:2.7.1`

`docker run -e "HDFS_HOST=192.168.99.100" -e "HDFS_PORT=9000" -d -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 2181:2181 vietanh85/hbase-master:1.2.1`

`docker run -d -p 9200:9200 -p 9300:9300 elasticsearch`

`docker run -d -p 7070:7070 -e "HBASE_MASTER_IP=192.168.99.100" -e "HBASE_MASTER_HOST=master" -e "HBASE_MASTER_PORT=16000" -e "REGION_SERVER_PORT=16020" -e "ZOOKEEPER_HOST=192.168.99.100" -e "ZOOKEEPER_PORT=2181" -e "ELASTICSEARCH_HOST=192.168.99.100" -e "ELASTICSEARCH_PORT=9300" -e "ELASTICSEARCH_CLUSTERNAME=elasticsearch" -e "HDFS_HOST=192.168.99.100" -e "HDFS_PORT=9000" vietanh85/pio-eventserver:0.9.5`