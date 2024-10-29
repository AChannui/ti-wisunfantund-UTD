#!/bin/bash

# cd /app

if ! yq . < kea-conf.yml > kea-conf.json; then
    echo "failed to convert kea-conf.yml to json - test yml conversion with 'yq . < [YML FILE] > [JSON OUTPUT FILE]'"
    exit 1
fi

/app/sbin/kea-dhcp6 -c /app/kea-conf.json
