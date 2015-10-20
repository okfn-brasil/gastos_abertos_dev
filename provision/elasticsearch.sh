#!/usr/bin/env bash
echo 'Installing ElasticSearch...'

wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.deb
dpkg -i elasticsearch-1.7.3.deb

service elasticsearch start
