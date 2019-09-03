#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install postgresql-client default-mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*