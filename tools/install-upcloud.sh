#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    export UPCLOUD_CLI_VERSION=${UPCLOUD_CLI_VERSION:-3.37.0} && \
    export UPCLOUD_ARCH="amd64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export UPCLOUD_ARCH="arm64"; fi && \
    curl -LO https://github.com/UpCloudLtd/upcloud-cli/releases/download/v${UPCLOUD_CLI_VERSION}/upcloud-cli_${UPCLOUD_CLI_VERSION}_${UPCLOUD_ARCH}.deb && \
    apt install -y ./upcloud-cli_${UPCLOUD_CLI_VERSION}_${UPCLOUD_ARCH}.deb && \
    rm -rf ./upcloud-cli_${UPCLOUD_CLI_VERSION}_${UPCLOUD_ARCH}.deb
