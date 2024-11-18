#!/bin/bash

# rm kea-conf.json
# yq . < kea-conf.yml > kea-conf.json

if ! docker build --progress=plain -t alex-kea .; then
    echo failed to build docker
    exit 1
fi
docker run --rm --net=host alex-kea
