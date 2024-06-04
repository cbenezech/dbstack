#!/bin/bash
set -e

# manage users, remove password and add them to sudoers
useradd cbenezech -d /home/cbenezech/ -M -s /bin/bash
chown -R cbenezech: /home/cbenezech/
passwd -d cbenezech
usermod -aG sudo cbenezech