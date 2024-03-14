#!/usr/bin/env bash
set -e

rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /var/log/atop/*
rm -rf $HOME/.ssh/authorized_keys

for f in $(find /var/log -type f) ; do
  dd if=/dev/null of=$f
done