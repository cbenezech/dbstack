#!/bin/bash

source /etc/environment

docker run \
    -d \
    -p 8500:8500 \
    -p 8300:8300 \
    -p 8300:8300/udp \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8600:8600 \
    -p 8600:8600/udp \
    --name=consul-server \
    consul:1.15 agent -server -datacenter=GRA11 -node=$(hostname) -bootstrap-expect=3 -retry-join=192.168.100.10 -retry-join=192.168.100.11 -retry-join=192.168.100.12 -bind=0.0.0.0 -client=0.0.0.0 -advertise=$(hostname -I | cut -d " " -f1)