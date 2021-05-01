#!/usr/bin/env sh

set -eux; \
  cd /tmp && \
  export ARGO_VERSION=${ARGO_VERSION:-3.0.2} && \
  curl -sLO https://github.com/argoproj/argo/releases/download/v${ARGO_VERSION}/argo-linux-amd64.gz && \
  gunzip argo-linux-amd64.gz && \
  chmod +x argo-linux-amd64 && \
  mv ./argo-linux-amd64 /usr/local/bin/argo && \
  argo version && \
  mkdir -p /tools/argo/crds && \
  cd /tools/argo/crds && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/README.md && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_clusterworkflowtemplates.yaml && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_cronworkflows.yaml && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workfloweventbindings.yaml && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workflows.yaml && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workflowtemplates.yaml && \
  curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/kustomization.yaml
