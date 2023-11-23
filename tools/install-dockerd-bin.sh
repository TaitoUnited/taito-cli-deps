#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install iptables && \

    export DOCKER_VERSION=${DOCKER_VERSION:-24.0.7} && \
    export DOCKER_ARCH="x86_64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export DOCKER_ARCH="aarch64"; fi && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker && \
    rm docker/docker && \
    for file in docker/*; do upx -9v $file || echo "Packing failed"; done && \
    mv docker/* /usr/bin && \
    rmdir docker && \

    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
