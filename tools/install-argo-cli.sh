#!/usr/bin/env sh

set -eux; \
  cd /tmp && \
  export ARGO_VERSION=${ARGO_VERSION:-3.0.2} && \
  curl -sLO https://github.com/argoproj/argo/releases/download/v${ARGO_VERSION}/argo-linux-amd64.gz && \
  gunzip argo-linux-amd64.gz && \
  chmod +x argo-linux-amd64 && \
  mv ./argo-linux-amd64 /usr/local/bin/argo && \
  argo version
