#!/usr/bin/env sh

set -eux; \
    export DOCKER_BUILDX_VERSION=${DOCKER_BUILDX_VERSION:-0.20.1} && \
    export DOCKER_BUILDX_ARCH="linux-amd64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export DOCKER_BUILDX_ARCH="linux-arm64"; fi && \
    mkdir -p /usr/local/lib/docker/cli-plugins && \
    curl -SL "https://github.com/docker/buildx/releases/download/v$DOCKER_BUILDX_VERSION/buildx-v$DOCKER_BUILDX_VERSION.$DOCKER_BUILDX_ARCH" -o /usr/local/lib/docker/cli-plugins/docker-buildx && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx
