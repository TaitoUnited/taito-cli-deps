#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install python3 python3-venv && \
    rm -rf /usr/bin/python && \
    ln -s /usr/bin/python3.7 /usr/bin/python && \
    python --version && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
