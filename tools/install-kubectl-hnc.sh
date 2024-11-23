#!/usr/bin/env sh

set -eux; \
    export HNC_VERSION=${HNC_VERSION:-1.1.0} && \
    export HNC_PLATFORM="linux_amd64" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export DOCKER_BUILDX_ARCH="linux_arm64"; fi && \
    curl -L https://github.com/kubernetes-sigs/hierarchical-namespaces/releases/download/${HNC_VERSION}/kubectl-hns_${HNC_PLATFORM} -o /usr/bin/kubectl-hns && \
    chmod +x /usr/bin/kubectl-hns
