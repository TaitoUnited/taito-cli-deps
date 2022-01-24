#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install unzip && \

    mkdir /terraform && \
    cd /terraform && \
    export TERRAFORM_VERSION=${TERRAFORM_VERSION:-1.1.4} && \
    curl -o terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETPLATFORM#linux/}.zip" && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf /terraform && \

    apt-get -qqy --purge remove unzip && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
