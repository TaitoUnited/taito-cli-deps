#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -qqy install curl && \
    curl -sL https://github.com/digitalocean/doctl/releases/download/v${DO_VERSION}/doctl-${DO_VERSION}-linux-amd64.tar.gz | tar -xzv && \
    mv doctl /usr/local/bin/doctl && \
    apt-get -qqy --purge remove curl && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
