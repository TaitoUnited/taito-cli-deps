#!/usr/bin/env sh

set -eux; \
    mkdir /tmp/openshift && \
    cd /tmp/openshift && \
    curl -sL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | tar -xzv && \
    mv oc /usr/local/bin/oc && \
    rm -rf /tmp/openshift
