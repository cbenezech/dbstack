#!/bin/bash
source /etc/environment

docker run \
   -d \
   -p 8500:8500 \
   -p 8501:8501 \
   --name=consul-client \
   consul agent -ui -datacenter=GRA11 -node=$(hostname) -bind=0.0.0.0 -client=0.0.0.0 -retry-join=192.168.100.10 -retry-join=192.168.100.11 -retry-join=192.168.100.12 -advertise=$(hostname -I | cut -d " " -f1)