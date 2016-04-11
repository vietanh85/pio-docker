FROM java:8u45

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    HBASE_VERSION=1.2.1 \
    HBASE_HOME=/usr/share/hbase

ENV PATH=${PATH}:${JAVA_HOME}/bin:${HBASE_HOME}/bin:${HBASE_HOME}/sbin

RUN curl -Ls http://www.us.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz | tar -xz -C /usr/share \
 && ln -s /usr/share/hbase-$HBASE_VERSION $HBASE_HOME

# https://docs.docker.com/examples/running_ssh_service/
RUN apt-get update && apt-get install -y openssh-server rsync supervisor

RUN mkdir -p /var/run/sshd /var/log/supervisor \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa \
    && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys \
    && echo '\tStrictHostKeyChecking no' >> ~/.ssh/config \
    && echo '\nexport JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\n' >> $HBASE_HOME/conf/hbase-env.sh

COPY conf/*.* $HBASE_HOME/conf/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Hbase ports
EXPOSE 16000 16010 16020 16030 9090 9095 8080 8085

# ZooKeeper ports
EXPOSE 2181

ONBUILD COPY bootstrap.sh $HBASE_HOME/bin/bootstrap.sh
ONBUILD RUN chown root:root $HBASE_HOME/bin/bootstrap.sh && chmod 700 $HBASE_HOME/bin/bootstrap.sh

CMD [ "supervisord" ]