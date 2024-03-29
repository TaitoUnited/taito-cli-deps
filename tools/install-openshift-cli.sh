#!/usr/bin/env sh

set -eux; \
    apt-get -y update && \

    curl -fsSL \
      https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | \
      tar -xzvf - oc && \
    upx -9v oc && \
    mv oc /usr/local/bin/oc

    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
