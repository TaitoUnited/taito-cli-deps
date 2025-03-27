#!/bin/bash

if [[ ${1} ]]; then
  username=${1}
  su="su ${username} -s"
else
  username=$(whoami)
  su=""
fi

echo
echo "-----------------------------------------------------------------"
echo "Initializing user $username"
echo "-----------------------------------------------------------------"
echo

# Helm v3
${su} /bin/sh -c "
  helm repo add taito-charts https://taitounited.github.io/taito-charts &&
  helm repo add stable https://charts.helm.sh/stable &&
  helm repo add jetstack https://charts.jetstack.io &&
  helm repo add bitnami https://charts.bitnami.com/bitnami &&
  helm repo add apache-airflow https://airflow.apache.org &&
  helm repo update
"

${su} /bin/bash -c "
  if hash az 2>/dev/null; then
    az extension add --name azure-devops
  fi
"

# Terraform
mkdir -p "${HOME}/.terraform.d/plugin-cache"
