#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

# install PG repo
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list

# install PG + python packages
apt-get update -y
apt-get install -y \
    -o Dpkg::Options::=--force-confold \
    postgresql-14 \
    postgresql-client-14 \
    libpq-dev \
    python3 \
    python3-pip \
    python3-psycopg2 \
    python3-consul

# share PG bins with patroni
ln -s /usr/lib/postgresql/14/bin/* /usr/sbin/

# install patroni
pip install --upgrade setuptools
pip install patroni

systemctl stop postgresql
systemctl enable postgresql
rm -f /var/log/postgresql/postgresql-14-main.log

mkdir /data/patroni -p
chown postgres:postgres /data/patroni
chmod 700 /data/patroni

systemctl daemon-reload
systemctl enable patroni
