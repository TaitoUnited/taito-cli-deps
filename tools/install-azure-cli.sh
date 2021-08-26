#!/usr/bin/env sh

# TODO: Azure CLI is quite large. Install only some of it or compress with upx.

set -eux; \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -qqy install unzip && \

    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
      gpg --dearmor |
      tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    echo "deb [arch=${TARGETPLATFORM#linux/}] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > \
        /etc/apt/sources.list.d/azure-cli.list && \

    apt-get -qqy update && \
    apt-get -qqy install azure-cli && \
    # TODO: enable (/usr/bin/az: line 3: /usr/bin/../../opt/az/bin/python3: No such file or directory)
    # az extension add --name azure-devops && \

    export KUBELOGIN_VERSION=${KUBELOGIN_VERSION:-0.0.10} && \
    export KUBELOGIN_ARCH="linux-${TARGETPLATFORM#linux/}" && \
    # TODO: not available for linux/arm64?
    if [ ${KUBELOGIN_ARCH} = "linux-arm64" ]; then export KUBELOGIN_ARCH="darwin-arm64"; fi && \
    curl -L "https://github.com/Azure/kubelogin/releases/download/v${KUBELOGIN_VERSION}/kubelogin-${KUBELOGIN_ARCH}.zip" --output kubelogin.zip && \
    unzip kubelogin.zip && \
    mv "bin/$(echo $KUBELOGIN_ARCH | tr - _)/kubelogin" /usr/local/bin/kubelogin && \
    rm -rf bin && \

    apt-get -qqy --purge remove unzip && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
