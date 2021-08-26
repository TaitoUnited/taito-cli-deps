#!/usr/bin/env sh

set -eux; \
    curl "https://dl.google.com/cloudsql/cloud_sql_proxy.linux.${TARGETPLATFORM#linux/}" \
       > cloud_sql_proxy && \
     chmod +x cloud_sql_proxy && \
     mv cloud_sql_proxy /usr/local/bin
