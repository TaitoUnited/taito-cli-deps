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

# Helm v2
${su} /bin/sh -c "
  helm2 init --client-only &&
  helm2 plugin install https://github.com/rimusz/helm-tiller &&
  helm2 tiller start-ci &&
  helm2 repo add taito-charts https://taitounited.github.io/taito-charts/ &&
  helm2 repo add jetstack https://charts.jetstack.io &&
  helm2 repo add bitnami https://charts.bitnami.com/bitnami &&
  helm2 repo update &&
  helm2 tiller stop
"

# Helm v3
${su} /bin/sh -c "
  helm plugin install https://github.com/helm/helm-2to3.git &&
  helm repo add taito-charts https://taitounited.github.io/taito-charts &&
  helm repo add stable https://kubernetes-charts.storage.googleapis.com &&
  helm repo add jetstack https://charts.jetstack.io &&
  helm repo add bitnami https://charts.bitnami.com/bitnami &&
  helm repo update
"

${su} /bin/bash -c "
  if hash az 2>/dev/null; then
    az extension add --name azure-devops
  fi
"
