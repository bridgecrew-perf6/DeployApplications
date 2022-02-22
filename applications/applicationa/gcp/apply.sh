#!/usr/bin/env bash
set -e # Exit if error is detected during pipeline execution

GCP="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PWD=$(pwd)
cd "$GCP"/../k8s/ || exit

echo "***** Applying  $APPLICATION deployment  *****"
kubectl apply -f service.yaml --namespace="$KUBE_NAMESPACE"

sed 's|__IMAGE_TAG__|'"$IMAGE"'|g;' deployment.sample.yaml > deployment.yaml
kubectl apply -f deployment.yaml --namespace="$KUBE_NAMESPACE"


cd "$PWD" || exit




