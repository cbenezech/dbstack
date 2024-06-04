#!/bin/bash
set -e

echo 'HISTTIMEFORMAT="%d/%m/%y %T "' >> /etc/environment

# Adding repo for docker
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# installing packages in non interactive mode
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get dist-upgrade -o Dpkg::Options::=--force-confold -yq

apt-get install -y \
        -o Dpkg::Options::=--force-confold \
        jq  \
        git \
        dnsmasq \
        unzip \
        gcc \
        ncdu \
        htop \
        iotop \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        net-tools \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin
