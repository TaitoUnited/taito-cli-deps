#!/usr/bin/env sh

set -eux; \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get \
      > get_helm.sh && \
    chmod 700 get_helm.sh && \
    export HELM_VERSION=${HELM_VERSION:-v3.17.2} && \
    ./get_helm.sh -v "${HELM_VERSION}" && \
    rm ./get_helm.sh
