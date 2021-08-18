#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install iptables && \
    export DOCKER_VERSION=${DOCKER_VERSION:-20.10.8} && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker && \
    rm docker/docker && \
    upx -9v docker/* && \
    mv docker/* /usr/bin && \
    rmdir docker && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
