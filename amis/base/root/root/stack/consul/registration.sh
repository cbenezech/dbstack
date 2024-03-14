#!/bin/bash

# load environment variables
source /etc/environment

# execute the start-client or start-server depending on CONSUL_PROFILE variables
/bin/bash /root/stack/consul/start-$CONSUL_PROFILE.sh

# wait 10sec to let consul finish the join and initial communication
sleep 10

# register the instance into consul under infra
docker exec consul-$CONSUL_PROFILE consul kv put infra/$CLUSTER/$HOSTGROUP/members_ip/$(hostname) $(hostname -I | cut -d " " -f1)