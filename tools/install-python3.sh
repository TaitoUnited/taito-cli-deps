#!/usr/bin/env sh

# NOTE: required for full python programming env:
# build-essential libssl-dev libffi-dev python3-dev python3-pip

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install python3 && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
