#!/usr/bin/env sh

set -eux; \
    curl -fsSL \
      https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | \
      tar -xzvf - oc && \
    upx -9v oc && \
    mv oc /usr/local/bin/oc
