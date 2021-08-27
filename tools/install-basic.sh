#!/usr/bin/env sh

# TODO: most of these are not required in base image
set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      bash \
      jq \
      httpie \
      lsb-release \
      procps \
      openvpn \
      apt-transport-https \
      ca-certificates \
      software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
