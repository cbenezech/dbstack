#!/bin/bash
set -e

# Installing goss
curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.7/goss-linux-amd64 -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss