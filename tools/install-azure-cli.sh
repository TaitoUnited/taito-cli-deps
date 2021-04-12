#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -qqy install ca-certificates apt-transport-https lsb-release gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > \
        /etc/apt/sources.list.d/azure-cli.list && \
    apt-get -qqy update && \
    apt-get -qqy install azure-cli && \
    apt-get -qqy --purge remove gnupg && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

set -eux; \
    cd /tmp && \
    export KUBELOGIN_VERSION=${KUBELOGIN_VERSION:-0.0.9} && \
    curl -L https://github.com/Azure/kubelogin/releases/download/v${KUBELOGIN_VERSION}/kubelogin-linux-amd64.zip --output kubelogin.zip && \
    unzip kubelogin.zip && \
    mv bin/linux_amd64/kubelogin /usr/local/bin/kubelogin && \
    rm -rf bin
