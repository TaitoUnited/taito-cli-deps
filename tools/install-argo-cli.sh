#!/usr/bin/env sh

# TODO: https://github.com/argoproj/argo was moved and no longer contains releases?
# set -eux; \
#   cd /tmp && \
#   export ARGO_VERSION=${ARGO_VERSION:-3.0.7} && \
#   curl -sLO "https://github.com/argoproj/argo/releases/download/v${ARGO_VERSION}/argo-linux-${TARGETPLATFORM#linux/}.gz" && \
#   gunzip "argo-linux-${TARGETPLATFORM#linux/}.gz" && \
#   chmod +x "argo-linux-${TARGETPLATFORM#linux/}" && \
#   mv "./argo-linux-${TARGETPLATFORM#linux/}" /usr/local/bin/argo && \
#   argo version && \
#   mkdir -p /tools/argo-workflows/crds && \
#   cd /tools/argo-workflows/crds && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/README.md && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_clusterworkflowtemplates.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_cronworkflows.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workfloweventbindings.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workflows.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/argoproj.io_workflowtemplates.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/base/crds/minimal/kustomization.yaml && \
#   mkdir -p /tools/argo-events/crds && \
#   cd /tools/argo-events/crds && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-events/master/manifests/base/crds/argoproj.io_eventbus.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-events/master/manifests/base/crds/argoproj.io_eventsources.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-events/master/manifests/base/crds/argoproj.io_sensors.yaml && \
#   curl -O -J https://raw.githubusercontent.com/argoproj/argo-events/master/manifests/base/crds/kustomization.yaml
