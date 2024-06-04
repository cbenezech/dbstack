#cloud-config
bootcmd:
  - echo 'CONSUL_PROFILE=server' >> /etc/environment
  - echo 'CLUSTER=common' >> /etc/environment
  - echo 'HOSTGROUP=admin' >> /etc/environment