#!/bin/bash
set -e

# Forcing the destruction of those two folders to prevent any usage of user's cache / pip cache
rm -fr ~/.local
rm -fr ~/.cache


if [ "$(ls -A /tmp/root)" ];
then
  cd /tmp/root
  cp -r * /
fi

if [ -e "/etc/debian_version" ] ; then
  systemctl daemon-reload
fi
