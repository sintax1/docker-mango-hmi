FROM openjdk:8-jdk
MAINTAINER Jared Wiltshire <jared@infiniteautomation.com>

RUN mkdir -p /opt/mango \
    && wget -O /tmp/m2m2-fullCore-2.8.4.zip http://mangoautomation.net:9902/mangoBuilds/2.8.4/m2m2-fullCore-2.8.4.zip \
    && unzip /tmp/m2m2-fullCore-2.8.4.zip -d /opt/mango \
    && rm  /tmp/m2m2-fullCore-2.8.4.zip

ENV MA_HOME /opt/mango
ENV MA_CP $MA_HOME/overrides/classes:$MA_HOME/classes:$MA_HOME/overrides/properties:$MA_HOME/overrides/lib/*:$MA_HOME/lib/*

EXPOSE 8080

ENTRYPOINT exec java -server -cp $MA_CP -Dma.home=$MA_HOME -Djava.library.path=$MA_HOME/overrides/lib:$MA_HOME/lib:/usr/lib/jni/:$PATH com.serotonin.m2m2.Main
