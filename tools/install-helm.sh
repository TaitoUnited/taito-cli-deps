#!/usr/bin/env sh

set -eux; \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get \
      > get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh -v v2.16.12 && \
    mv /usr/local/bin/helm /usr/local/bin/helm2 && \
    export HELM_VERSION=${HELM_VERSION:-v3.3.3} && \
    ./get_helm.sh -v "${HELM_VERSION}" && \
    rm ./get_helm.sh
