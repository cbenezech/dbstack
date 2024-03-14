#!/usr/bin/env bash
set -e

# load environment variables
source /etc/environment

# run consul-template
exec /usr/local/bin/consul-template \
  -consul-addr localhost:8500 \
  -config="/root/stack/haproxy/haproxy-cfg-tpl.conf"
  -retry 30s