#!/usr/bin/env sh

set -eux; \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
      >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    (apt-get -y update || :) && \
    # TODO: python3-pip and pip3 install ansible should not be required
    apt-get -y install ansible python3-pip && \
    pip3 install ansible && \
    apt-get -qqy --purge remove python3-pip && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
