#!/usr/bin/env sh

set -eux; \
    mkdir /terraform && \
    cd /terraform && \
    export TERRAFORM_VERSION=${TERRAFORM_VERSION:-1.0.0} && \
    curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf /terraform
