#!/usr/bin/env sh

set -eux; \
    echo "deb http://packages.cloud.google.com/apt gcsfuse-stretch main" | \
      tee /etc/apt/sources.list.d/gcsfuse.list; \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
      apt-key add - && \
    apt-get -y update && \
    apt-get -y install gcsfuse && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
