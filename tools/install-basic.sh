#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      gnupg \
      git \
      bash \
      jq \
      httpie \
      procps \
      openvpn \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      gettext-base \
      upx-ucl \
      unzip \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
