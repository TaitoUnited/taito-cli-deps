FROM taitounited/taito-cli-base
MAINTAINER Taito United <support@taitounited.fi>

# TODO: Backwards compatibility for auth sessions. Remove later.
RUN mkdir -p /builder/google-cloud-sdk/bin && \
    ln -s /usr/bin/gcloud /builder/google-cloud-sdk/bin/gcloud

# Install some extra tools for local use of Taito CLI
RUN apt-get -y update && \
    apt-get -y install \
      curl \
      unzip \
      perl-doc \
      less \
      telnet \
      jq \
      apache2-utils \
      vim \
      nano \
      wamerican \
      groff \
      dnsutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV EDITOR=/bin/nano

# Install depcheck for checking npm dependencies
RUN npm install depcheck npm-check -g

# Install terraform
ENV TERRAFORM_VERSION 0.12.7
RUN /taito-cli-deps/tools/install-terraform.sh

# Install ansible
RUN /taito-cli-deps/tools/install-ansible.sh

# Install aws cli and aws-iam-authenticator for AWS
ENV AWS_VERSION=1.12.7/2019-03-27
RUN /taito-cli-deps/tools/install-aws.sh

# Install gcloud sdk for GCP
ENV CLOUD_SDK_VERSION=259.0.0
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"
RUN /taito-cli-deps/tools/install-gcloud.sh

# Install gcsfuse for mounting GCP storage buckets
# RUN /taito-cli-deps/tools/install-gcsfuse.sh

# Install digitalocean cli
ENV DO_VERSION 1.30.0
RUN /taito-cli-deps/tools/install-do.sh

# Install Azure CLI
RUN /taito-cli-deps/tools/install-azure-cli.sh