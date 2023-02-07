#!/usr/bin/env sh

set -eux; \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get -qqy update && \
    export KUBECTL_VERSION=${KUBECTL_VERSION:-1.23.16-00} && \
    apt-get -qqy install "kubectl=${KUBECTL_VERSION}" && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
