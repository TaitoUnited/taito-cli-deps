#!/usr/bin/env sh

# TODO: Node.js is quite large. Install only some of it or compress with upx.

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install build-essential && \
    export NODEJS_VERSION=${NODEJS_VERSION:-20.x} && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
     | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODEJS_VERSION nodistro main" \
     > /etc/apt/sources.list.d/nodesource.list && \
    apt-get -qqy update && apt-get -qqy install nodejs && \
    apt-get -qqy --purge remove build-essential && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    (npm config set -g spin=false || :) && \
    npm config set -g progress=false && \
    corepack enable # For yarn
