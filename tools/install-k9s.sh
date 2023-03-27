#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    export K9S_VERSION=${K9S_VERSION:-0.27.3} && \
    export K9S_ARCH="Linux_amd64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export K9S_ARCH="Linux_arm64"; fi && \
    curl -L "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_${K9S_ARCH}.tar.gz" | tar -xz && \
    mv k9s /usr/bin && \
    rm -rf *
