#!/bin/bash

rm kea-conf.json
yq . < kea-conf.yml > kea-conf.json

docker build --progress=plain -t alex-kea .
docker run --rm --net=host alex-kea
