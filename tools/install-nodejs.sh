#!/usr/bin/env sh

# TODO: Node.js is quite large. Install only some of it or compress with upx.

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install build-essential && \
    export NODEJS_VERSION=${NODEJS_VERSION:-16.x} && \
    curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} | bash - && \
    apt-get -qqy update && apt-get -qqy install nodejs && \
    apt-get -qqy --purge remove build-essential && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm config set spin=false && \
    npm config set progress=false
