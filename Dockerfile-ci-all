FROM taitounited/taito-cli-ci
MAINTAINER Taito United <support@taitounited.fi>

# Install dockerd
# On AWS CodeBuild dockerd must be running when building docker images
RUN /taito-cli-deps/tools/install-dockerd-bin.sh

# Install aws cli and aws-iam-authenticator
RUN /taito-cli-deps/tools/install-aws.sh

# Install Azure CLI
RUN /taito-cli-deps/tools/install-azure-cli.sh

# Install gcloud sdk
ENV PATH "$PATH:/opt/google-cloud-sdk/bin/"
RUN /taito-cli-deps/tools/install-gcloud.sh

# Install digitalocean cli
RUN /taito-cli-deps/tools/install-do.sh
