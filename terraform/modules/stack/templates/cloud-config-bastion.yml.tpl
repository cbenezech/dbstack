#cloud-config
bootcmd:
  - echo 'CONSUL_PROFILE=client' >> /etc/environment
  - echo 'CLUSTER=common' >> /etc/environment
  - echo 'HOSTGROUP=bastion' >> /etc/environment