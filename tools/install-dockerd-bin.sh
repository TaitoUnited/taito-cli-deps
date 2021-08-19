#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install iptables && \
    export DOCKER_VERSION=${DOCKER_VERSION:-20.10.8} && \
    export DOCKER_ARCH="x86_64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export DOCKER_ARCH="aarch64"; fi && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker && \
    rm docker/docker && \
    # NOTE: quick fix for upx: "docker/ctr: CantPackException: bad DT_SYMTAB"
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then rm -f docker/ctr; fi && \
    upx -9v docker/* && \
    mv docker/* /usr/bin && \
    rmdir docker && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
