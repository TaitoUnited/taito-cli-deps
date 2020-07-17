#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && apt-get install -qqy \
      python-dev \
      python-setuptools \
      python-pip \
      lsb-release && \
    pip install -U crcmod && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > \
      /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    export CLOUD_SDK_VERSION=${CLOUD_SDK_VERSION:-301.0.0} && \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 && \
    curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
      > cloud_sql_proxy && \
    chmod +x cloud_sql_proxy && \
    mv cloud_sql_proxy /usr/local/bin && \
    apt-get --purge remove -qqy \
      python-dev \
      python-setuptools \
      python-pip \
      lsb-release && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
