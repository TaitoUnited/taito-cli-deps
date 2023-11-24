#!/usr/bin/env sh

set -eux; \
    apt-get -y update && \

    export DOCKER_VERSION=${DOCKER_VERSION:-23.0.1} && \
    export DOCKER_ARCH="x86_64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export DOCKER_ARCH="aarch64"; fi && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker/docker && \
    upx -9v docker/docker && \
    mv docker/docker /usr/bin/docker && \
    rmdir docker && \
    groupadd docker && \

    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
