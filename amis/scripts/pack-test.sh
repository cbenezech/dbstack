#!/usr/bin/env bash

STATUS=0
export GOSS_CFG="/tmp/tests/goss.yaml"

if [ "$(ls -A /tmp/tests/goss)" ] ; then
    cd /tmp/tests
    if [ -e "${GOSS_CFG}" ] ; then
        /usr/local/bin/goss --gossfile ${GOSS_CFG} --package deb validate --format documentation || STATUS=1
    else
        echo "No file '${GOSS_CFG}', no tests setup for Goss. So nothing to validate!"
        STATUS=1
    fi
fi

exit $STATUS
