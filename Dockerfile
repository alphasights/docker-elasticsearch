FROM jjbohn/java
MAINTAINER John Bohn <jjbohn@gmail.com>

ENV HOME /root

CMD ["/sbin/my_init"]

# Download and install elasticsearch
WORKDIR /opt

RUN curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz
RUN tar -zxvf elasticsearch-1.3.2.tar.gz
RUN rm elasticsearch-1.3.2.tar.gz
RUN mv elasticsearch-1.3.2 elasticsearch

RUN mkdir /etc/service/elasticsearch
ADD elasticsearch.sh /etc/service/elasticsearch/run
RUN chmod 775 /etc/service/elasticsearch/run

EXPOSE 9200
EXPOSE 9300

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
