FROM centos:latest
RUN yum update -y && yum install wget -y && yum install java -y
ENV JAVA_HOME /etc/alternatives/jre_1.8.0_openjdk
RUN mkdir /data
RUN wget http://mirror.csclub.uwaterloo.ca/apache/zookeeper/stable/apache-zookeeper-3.5.6-bin.tar.gz
RUN tar -xvzf apache-zookeeper-3.5.6-bin.tar.gz
RUN mv apache-zookeeper-3.5.6-bin /opt/zookeeper
COPY zoo.cfg /opt/zookeeper/conf/zoo.cfg
ENV ZOOKEEPER_HOME /opt/zookeeper/bin
ENV PATH=$PATH:$ZOOKEEPER_HOME
ENV ZOO_MAX_CLIENT_CNXNS 600
CMD [ "/opt/zookeeper/bin/zkServer.sh", "start-foreground" ]
