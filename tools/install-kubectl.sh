#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get -qqy update && \
    apt-get -qqy install kubectl && \
    apt-get -qqy --purge remove curl && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
