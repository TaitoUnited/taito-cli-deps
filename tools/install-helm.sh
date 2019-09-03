#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install curl && \
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get \
      > get_helm.sh && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm ./get_helm.sh && \
    apt-get -qqy --purge remove curl && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*