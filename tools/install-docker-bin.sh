#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install upx-ucl && \
    export DOCKER_VERSION=${DOCKER_VERSION:-19.03.5} && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker/docker && \
    upx -9v docker/docker && \
    mv docker/docker /usr/bin/docker && \
    rmdir docker && \
    groupadd --gid 999 docker && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
