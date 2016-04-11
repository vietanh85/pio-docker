FROM java:8u45

ENV HADOOP_VERSION=2.6 \
    SPARK_VERSION=1.6.1 \
    SPARK_HOME=/usr/share/spark

ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH



RUN curl -Ls http://www-us.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz | tar -xz -C /usr/share \
 && ln -s /usr/share/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION $SPARK_HOME

RUN apt-get update && apt-get install -y supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY bootstrap.sh $PIO_HOME/bin/bootstrap.sh

RUN mkdir -p /var/log/supervisor
RUN chown root:root $PIO_HOME/bin/bootstrap.sh && chmod 700 $PIO_HOME/bin/bootstrap.sh

# master port
EXPOSE 7077

CMD ["supervisord"]