FROM vietanh85/spark:1.6.1

ENV PIO_VERSION=0.9.6 \
    PIO_HOME=/usr/share/pio

ENV PIO_FS_BASEDIR=$PIO_HOME/.pio_store \
    HBASE_CONF_DIR=$PIO_HOME/conf

ENV PIO_FS_ENGINESDIR=$PIO_FS_BASEDIR/engines \
    PIO_FS_TMPDIR=$PIO_FS_BASEDIR/tmp \
    PATH=${PIO_HOME}/bin:${PIO_HOME}/sbin:$PATH

RUN curl -Ls https://d8k1yxp8elc6b.cloudfront.net/PredictionIO-$PIO_VERSION.tar.gz | tar -xz -C /usr/share \
 && ln -s /usr/share/PredictionIO-$PIO_VERSION $PIO_HOME

WORKDIR $PIO_HOME

COPY conf/*.* $HBASE_CONF_DIR/
COPY *.sh $PIO_HOME/bin/
# COPY wait.sh $PIO_HOME/bin/wait.sh

RUN chown root:root $PIO_HOME/bin/*.sh && chmod 700 $PIO_HOME/bin/*.sh

ONBUILD COPY bootstrap.sh $PIO_HOME/bin/bootstrap.sh
ONBUILD RUN chown root:root $PIO_HOME/bin/bootstrap.sh && chmod 700 $PIO_HOME/bin/bootstrap.sh

EXPOSE 7070

CMD ["bootstrap.sh"]
