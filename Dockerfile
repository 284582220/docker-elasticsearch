FROM  docker.elastic.co/elasticsearch/elasticsearch:6.4.2

MAINTAINER yanggj_horse@163.com

# Override config, otherwise plug-in install will fail
ADD config  /usr/share/elasticsearch/config
RUN mkdir -p /usr/share/elasticsearch/config/certs
ADD certs  /usr/share/elasticsearch/config/certs
RUN chown -R elasticsearch  /usr/share/elasticsearch/config

RUN mkdir -p /usr/share/elasticsearch/data

ADD x-pack/x-pack-core-6.4.2.jar   /usr/share/elasticsearch/modules/x-pack-core

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false
