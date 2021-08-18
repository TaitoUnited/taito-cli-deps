#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install gnupg && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
      add-apt-repository \
      "deb [arch=${TARGETPLATFORM#linux/}] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
    apt-get -qqy update && \
    apt-get -qqy install docker-ce && \
    apt-get -qqy --purge remove gnupg && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
