#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf awscli* && \
    apt-get -qqy update && apt-get install -qqy python && \ # TODO: remove?
    npm install -g aws-cdk
