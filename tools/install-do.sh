#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    export DO_VERSION=${DO_VERSION:-1.65.0} && \
    curl -sL "https://github.com/digitalocean/doctl/releases/download/v${DO_VERSION}/doctl-${DO_VERSION}-linux-${TARGETPLATFORM#linux/}.tar.gz" | tar -xzv && \
    mv doctl /usr/local/bin/doctl
