#!/usr/bin/env sh

# TODO: Azure CLI is quite large. Install only some of it or compress with upx.
# Remove custom python3 (/opt/az/bin/python3) and non-dist py code from
# extensions?

set -eux; \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -qqy install unzip && \

    curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
      gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg && \

    AZ_VERSION=${AZ_VERSION:-2.64.0} && \
    AZ_DIST=$(lsb_release -cs) && \
    echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | 
      tee /etc/apt/sources.list.d/azure-cli.sources && \

    apt-get -qqy update && \
    apt-get -qqy install azure-cli=${AZ_VERSION}-1~${AZ_DIST} && \
    # TODO: enable (/usr/bin/az: line 3: /usr/bin/../../opt/az/bin/python3: No such file or directory)
    # az extension add --name azure-devops && \

    export KUBELOGIN_VERSION=${KUBELOGIN_VERSION:-0.1.4} && \
    export KUBELOGIN_ARCH="linux-${TARGETPLATFORM#linux/}" && \
    curl -L "https://github.com/Azure/kubelogin/releases/download/v${KUBELOGIN_VERSION}/kubelogin-${KUBELOGIN_ARCH}.zip" --output kubelogin.zip && \
    unzip kubelogin.zip && \
    mv "bin/$(echo $KUBELOGIN_ARCH | tr - _)/kubelogin" /usr/local/bin/kubelogin && \
    rm -f kubelogin.zip && \
    rm -rf bin && \

    apt-get -qqy --purge remove unzip && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
