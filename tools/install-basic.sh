#!/usr/bin/env sh

# TODO: most of these are not required in base image
set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      gnupg \
      bash \
      jq \
      httpie \
      lsb-release \
      openvpn \
      easy-rsa \
      apt-transport-https \
      ca-certificates \
      software-properties-common \
      gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
