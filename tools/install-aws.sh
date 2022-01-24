#!/usr/bin/env sh

# TODO: AWS bundle is quite large. Install only some of it or compress with upx.

set -eux; \
    export AWS_ARCH="64bit" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export AWS_ARCH="arm64"; fi && \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -y install unzip python3-venv && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    python3 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf awscli* && \
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_${AWS_ARCH}/session-manager-plugin.deb" \
        -o "session-manager-plugin.deb" && \
    dpkg -i session-manager-plugin.deb && \
    rm -f session-manager-plugin.deb && \
    npm install -g aws-cdk && \
    apt-get -qqy --purge remove unzip python3-venv && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
