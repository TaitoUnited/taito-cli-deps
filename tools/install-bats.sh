#!/usr/bin/env sh

set -eux; \
    git clone https://github.com/bats-core/bats-core.git && \
    ./bats-core/install.sh /usr/local && \
    rm -rf bats-core