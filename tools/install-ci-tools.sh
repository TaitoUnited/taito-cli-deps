#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      git-lfs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
