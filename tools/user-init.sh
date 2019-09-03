#!/bin/bash

username=${1}

echo
echo "-----------------------------------------------------------------"
echo "Initializing user $username"
echo "-----------------------------------------------------------------"
echo

su "${username}" -s /bin/sh -c "
  helm init --client-only &&
  helm plugin install https://github.com/rimusz/helm-tiller &&
  helm tiller start-ci &&
  helm repo add taito-charts https://taitounited.github.io/taito-charts/ &&
  helm repo add jetstack https://charts.jetstack.io &&
  helm repo add bitnami https://charts.bitnami.com &&
  helm repo update &&
  helm tiller stop
"
