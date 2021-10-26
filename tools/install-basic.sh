#!/usr/bin/env sh

# TODO: most of these are not required in base image
set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      bash \
      jq \
      git \
      zip \
      httpie \
      lsb-release \
      procps \
      gnupg \
      gettext-base \
      openvpn \
      apt-transport-https \
      ca-certificates \
      software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
