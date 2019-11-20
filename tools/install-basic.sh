#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      gnupg \
      git \
      bash \
      jq \
      procps \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      gettext-base \
      unzip \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
