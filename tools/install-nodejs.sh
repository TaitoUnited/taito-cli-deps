#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install curl build-essential && \
    curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} | bash - && \
    apt-get -qqy update && apt-get -qqy install nodejs && \
    apt-get -qqy --purge remove curl build-essential && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm config set spin=false && \
    npm config set progress=false
