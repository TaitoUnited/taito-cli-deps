#!/usr/bin/env sh

# TODO: GCP SDK is quite large. Install only some of it or compress with upx.

set -eux; \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" |
      tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |
      apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y && \
    # TODO: google-cloud-cli-gke-gcloud-auth-plugin not available for arm?
    if [ ${TARGETPLATFORM} != "linux/arm64" ]; then
        apt-get update -y && apt-get install google-cloud-cli-gke-gcloud-auth-plugin -y
    fi

