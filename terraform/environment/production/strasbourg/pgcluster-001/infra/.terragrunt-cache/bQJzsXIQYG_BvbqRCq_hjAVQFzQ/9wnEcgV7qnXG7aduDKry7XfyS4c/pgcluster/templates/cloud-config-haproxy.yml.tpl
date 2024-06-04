#cloud-config
bootcmd:
  - echo 'CONSUL_PROFILE=client' >> /etc/environment
  - echo 'CLUSTER=${cluster_name}' >> /etc/environment
  - echo 'HOSTGROUP=haproxy' >> /etc/environment