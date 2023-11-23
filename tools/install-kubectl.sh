#!/usr/bin/env sh

set -eux; \
    export KUBECTL_BASE_VERSION=${KUBECTL_VERSION:-1.27} && \
    export KUBECTL_VERSION=${KUBECTL_VERSION:-1.27.6-00} && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v${KUBECTL_BASE_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${KUBECTL_BASE_VERSION}/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    apt-get -qqy update && \
    apt-get -qqy install "kubectl=${KUBECTL_VERSION}" && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
