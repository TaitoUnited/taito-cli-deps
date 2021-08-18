#!/usr/bin/env sh

set -eux; \
    export DOCKER_VERSION=${DOCKER_VERSION:-20.10.8} && \
    curl -fsSL \
      https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
      tar -xzvf - docker/docker && \
    upx -9v docker/docker && \
    mv docker/docker /usr/bin/docker && \
    rmdir docker && \
    groupadd --gid 999 docker
