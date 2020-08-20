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

if helm version | grep "SemVer:\"v2." > /dev/null; then
  # TODO: remove once helm v2 is obsolete
  ${su} /bin/sh -c "
    helm init --client-only &&
    helm plugin install https://github.com/rimusz/helm-tiller &&
    helm tiller start-ci &&
    helm repo add taito-charts https://taitounited.github.io/taito-charts/ &&
    helm repo add jetstack https://charts.jetstack.io &&
    helm repo add bitnami https://charts.bitnami.com/bitnami &&
    helm repo update &&
    helm tiller stop
  "
else
  ${su} /bin/sh -c "
    helm repo add taito-charts https://taitounited.github.io/taito-charts/ &&
    helm repo add jetstack https://charts.jetstack.io &&
    helm repo add bitnami https://charts.bitnami.com/bitnami &&
    helm repo update
  "
fi

${su} /bin/bash -c "
  if hash az 2>/dev/null; then
    az extension add --name azure-devops
  fi
"
