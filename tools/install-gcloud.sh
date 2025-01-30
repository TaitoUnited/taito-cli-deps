#!/usr/bin/env sh

# TODO: GCP SDK is quite large. Install only some of it or compress with upx.

set -eux; \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" |
      tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |
      gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    # NOTE: There are some connection problems with newer gcloud versions: https://www.reddit.com/r/googlecloud/comments/1aopr51/gcloud_constantly_hangs_with_ipv6/
    export GCLOUD_CLI_VERSION=${GCLOUD_SDK_VERSION:-508.0.0-0} && \
    export GCLOUD_AUTH_VERSION=${GCLOUD_AUTH_VERSION:-508.0.0-0} && \
    apt-get update -y && apt-get install google-cloud-cli=${GCLOUD_CLI_VERSION} -y && \
    apt-get update -y && apt-get install google-cloud-cli-gke-gcloud-auth-plugin=${GCLOUD_AUTH_VERSION} -y && \
    # Install cloud sql proxy
    export CLOUD_SQL_PROXY_VERSION=${CLOUD_SQL_PROXY_VERSION:-2.14.3} && \
    curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v${CLOUD_SQL_PROXY_VERSION}/cloud-sql-proxy.linux.${TARGETPLATFORM#linux/} && \
    chmod +x cloud-sql-proxy && \
    mv cloud-sql-proxy /usr/local/bin
