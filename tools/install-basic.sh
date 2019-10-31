#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      gnupg \
      git \
      bash \
      procps \
      apt-transport-https \
      ca-certificates \
      software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
