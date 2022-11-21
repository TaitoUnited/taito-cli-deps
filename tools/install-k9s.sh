#!/usr/bin/env sh

set -eux; \
    cd /tmp && \
    export K9S_VERSION=${K9S_VERSION:-0.26.7} && \
    export K9S_ARCH="Linux_${TARGETPLATFORM#linux/}" && \
    curl -L "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_${K9S_ARCH}.tar.gz" | tar -xz && \
    mv k9s /usr/bin && \
    rm -rf *
