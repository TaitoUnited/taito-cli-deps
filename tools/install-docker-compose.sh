#!/usr/bin/env sh

set -eux; \
    export DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-2.27.1} && \
    mkdir -p /usr/local/lib/docker/cli-plugins && \
    curl -SL "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/lib/docker/cli-plugins/docker-compose && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
