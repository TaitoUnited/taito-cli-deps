#!/usr/bin/env sh

# TODO: use alternative installation for linux/arm64
if [ ${TARGETPLATFORM} != "linux/arm64" ]; then
set -eux; \
    mkdir -p /usr/local/lib/docker/cli-plugins && \
    export DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-2.1.1} && \
    curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/lib/docker/cli-plugins/docker-compose && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
fi
