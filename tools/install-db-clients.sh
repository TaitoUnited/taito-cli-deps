#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list && \
    apt-get -qqy install postgresql-client-12 default-mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
