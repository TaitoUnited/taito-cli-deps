#!/usr/bin/env sh

# TODO: GCP SDK is quite large. Install only some of it or compress with upx.

set -eux; \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" |
      tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |
      apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    export GCLOUD_CLI_VERSION=${GCLOUD_SDK_VERSION:-420.0.0-0} && \
    export GCLOUD_AUTH_VERSION=${GCLOUD_AUTH_VERSION:-420.0.0-0} && \
    apt-get update -y && apt-get install google-cloud-sdk=${GCLOUD_CLI_VERSION} -y && \
    apt-get update -y && apt-get install google-cloud-cli-gke-gcloud-auth-plugin=${GCLOUD_AUTH_VERSION} -y
