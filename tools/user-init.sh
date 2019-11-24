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

${su} /bin/sh -c "
  helm init --client-only &&
  helm plugin install https://github.com/rimusz/helm-tiller &&
  helm tiller start-ci &&
  helm repo add taito-charts https://taitounited.github.io/taito-charts/ &&
  helm repo add jetstack https://charts.jetstack.io &&
  helm repo add bitnami https://charts.bitnami.com &&
  helm repo update &&
  helm tiller stop
"

${su} /bin/bash -c "
  if hash az 2>/dev/null; then
    az extension add --name azure-devops
  fi
"
