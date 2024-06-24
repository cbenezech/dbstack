#!/bin/bash
set -e

# installing repo
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list

# installing packages
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install haproxy pgadmin4 pgadmin4-web -o Dpkg::Options::=--force-confold -y


# proxy configuration
chmod +x /root/stack/haproxy/haproxy-cfg.sh
systemctl enable haproxy-config

# install pgadmin
export PGADMIN_SETUP_EMAIL="admin@exemple.com"
export PGADMIN_SETUP_PASSWORD="123Hello"
. /usr/pgadmin4/bin/setup-web.sh --yes