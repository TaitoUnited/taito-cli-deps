FROM debian:stable-slim
MAINTAINER Taito United <support@taitounited.fi>

USER root
COPY . /taito-cli-deps
WORKDIR /tmp

# Install some basic tools
RUN /taito-cli-deps/tools/install-basic.sh

# Install Node.js
RUN /taito-cli-deps/tools/install-nodejs.sh

# Install yamljs for yaml-json conversions
RUN npm install -g yamljs

# Install kubectl and helm for Kubernetes
RUN /taito-cli-deps/tools/install-kubectl.sh
RUN /taito-cli-deps/tools/install-helm.sh

# Install database tools
RUN /taito-cli-deps/tools/install-db-clients.sh
RUN /taito-cli-deps/tools/install-sqitch.sh

# Install terraform
RUN /taito-cli-deps/tools/install-terraform.sh

# Install bats for Taito CLI unit testing
RUN /taito-cli-deps/tools/install-bats.sh

# Initialize root user
RUN /taito-cli-deps/tools/user-init.sh root
