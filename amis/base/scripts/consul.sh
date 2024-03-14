#!/bin/bash
set -e

# install consul-template
wget https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip
unzip consul-template_0.30.0_linux_amd64.zip
chmod +x consul-template
mv consul-template /usr/local/bin/

# enable consul-registration service and give execution permission on scripts
chmod +x /root/stack/consul/registration.sh
chmod +x /root/stack/consul/start-client.sh
chmod +x /root/stack/consul/start-server.sh
systemctl enable consul-registration.service

# download consul image
docker pull consul:latest
