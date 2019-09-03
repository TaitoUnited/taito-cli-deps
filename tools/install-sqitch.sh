#!/usr/bin/env sh

set -eux; \
    apt-get -qqy update && \
    apt-get -qqy install build-essential perl cpanminus libdbd-pg-perl libdatetime-perl libclone-perl \
      libperlio-utf8-strict-perl libhash-merge-perl && \
    cpanm --quiet --notest App::Sqitch && \
    apt-get -qqy --purge remove build-essential && \
    apt-get -qqy --purge autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
