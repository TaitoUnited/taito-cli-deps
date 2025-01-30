#!/usr/bin/env sh

# NOTE: httpie was removed because of a installation problem. But looks like it isn't used anywhere.

# TODO: most of these are not required in base image
set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install \
      curl \
      bash \
      jq \
      locales \
      git \
      zip \
      lsb-release \
      procps \
      gnupg \
      gettext-base \
      openvpn \
      apt-transport-https \
      ca-certificates \
      software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # Install upx-ucl
    cd /tmp && \
    export UPX_VERSION=${UPX_VERSION:-4.2.4} && \
    export UPX_ARCH="amd64_linux" && \
    if [ ${TARGETPLATFORM} = "linux/arm64" ]; then export UPX_ARCH="arm64_linux"; fi && \
    curl -L "https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-${UPX_ARCH}.tar.xz" | unxz | tar -x && \
    mv "./upx-${UPX_VERSION}-${UPX_ARCH}/upx" /usr/bin/upx && \
    rm -rf "upx-${UPX_VERSION}-${UPX_ARCH}"
