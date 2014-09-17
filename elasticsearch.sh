#!/bin/bash
config_url=${ELASTICSEARCH_CONFIG_URL:?"You must set ELASTICSEARCH_CONFIG_URL"}

/usr/bin/curl -o /opt/elasticsearch/config/elasticsearch.yml "$config_url"
/opt/elasticsearch/bin/elasticsearch
