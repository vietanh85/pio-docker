FROM java:8u45

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    HADOOP_VERSION=2.7.1 \
    HADOOP_HOME=/usr/share/hadoop

ENV HADOOP_PREFIX=$HADOOP_HOME \
    HADOOP_HDFS_HOME=$HADOOP_HOME \
    HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop \
    PATH=${PATH}:${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

RUN curl -Ls http://www.us.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar -xz -C /usr/share \
    && ln -s /usr/share/hadoop-$HADOOP_VERSION $HADOOP_HOME

# https://docs.docker.com/examples/running_ssh_service/
RUN apt-get update && apt-get install -y openssh-server rsync supervisor

RUN mkdir -p /var/run/sshd /var/log/supervisor \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa \
    && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys \
    && echo '\tStrictHostKeyChecking no' >> ~/.ssh/config \
    && sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\n:' $HADOOP_CONF_DIR/hadoop-env.sh

COPY conf/*.* $HADOOP_CONF_DIR/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ONBUILD ADD bootstrap.sh $HADOOP_HOME/bin/bootstrap.sh
ONBUILD RUN chown root:root $HADOOP_HOME/bin/bootstrap.sh && chmod 700 $HADOOP_HOME/bin/bootstrap.sh

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 9000

CMD [ "supervisord" ]