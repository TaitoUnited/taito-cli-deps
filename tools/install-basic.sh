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
      lsb-release \
      openvpn \
      easy-rsa \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      gettext-base \
      python3 \
      python3-venv \
      upx-ucl \
      unzip \
      zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
