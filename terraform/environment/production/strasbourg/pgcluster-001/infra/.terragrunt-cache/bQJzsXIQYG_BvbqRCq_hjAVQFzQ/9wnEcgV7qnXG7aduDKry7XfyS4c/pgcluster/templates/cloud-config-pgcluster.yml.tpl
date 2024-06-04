#cloud-config
bootcmd:
  - echo 'CONSUL_PROFILE=client' >> /etc/environment
  - echo 'CLUSTER=${cluster_name}' >> /etc/environment
  - echo 'HOSTGROUP=pgcluster' >> /etc/environment
  - sed "s/HOSTNAME/$(hostname)/g" /etc/patroni.yml.tpl | sed "s/CLUSTER/${cluster_name}/g" |sed "s/HOST_IP/$(hostname -I | cut -d " " -f1)/g" > /etc/patroni.yml