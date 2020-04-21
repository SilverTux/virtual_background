#!/bin/bash

set -euo pipefail

docker build -t virtual_background .

#docker run -d virtual_background

docker run -d \
    -u "$(id -u):$(getent group video | cut -d: -f3)" \
    --device=/dev/video0 \
    --device=/dev/video20 \
    virtual_background
#    --entrypoint /opt/run.sh \
