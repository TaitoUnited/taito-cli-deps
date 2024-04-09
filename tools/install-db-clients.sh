#!/usr/bin/env sh

set -eux; \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list && \
    apt-get -qqy update && \
    apt-get -qqy install postgresql-client-16 default-mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
