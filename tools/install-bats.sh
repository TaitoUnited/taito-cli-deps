#!/usr/bin/env sh

set -eux; \
    apt-get -y update && \
    apt-get -y install git && \

    git clone https://github.com/bats-core/bats-core.git && \
    ./bats-core/install.sh /usr/local && \
    rm -rf bats-core && \

    apt-get -qqy --purge remove git && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
