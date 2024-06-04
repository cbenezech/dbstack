#!/bin/bash
source /etc/environment

docker run \
   -d \
   -p 8500:8500 \
   -p 8501:8501 \
   --name=consul-client \
   consul agent -ui -datacenter=SBG5 -node=$(hostname) -bind=0.0.0.0 -client=0.0.0.0 -retry-join=10.0.0.10 -retry-join=10.0.0.11 -retry-join=10.0.0.12 -advertise=$(hostname -I | cut -d " " -f1)