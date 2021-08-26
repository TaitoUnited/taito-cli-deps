#!/usr/bin/env sh

# TODO: AWS bundle is quite large. Install only some of it or compress with upx.

set -eux; \
    cd /tmp && \
    apt-get -qqy update && \
    apt-get -y install unzip python3-venv && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf awscli* && \
    npm install -g aws-cdk && \
    apt-get -qqy --purge remove unzip python3-venv && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
