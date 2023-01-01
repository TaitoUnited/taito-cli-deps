#!/usr/bin/env sh

set -eux; \
    export DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-2.14.2} && \
    curl -L "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
