#!/usr/bin/env bash
set -e # Exit if error is detected during pipeline execution

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "***** Applying  $APPLICATION deployment  *****"
K8S="$DIR/../k8s/"
sed 's|__IMAGE_TAG__|'"$IMAGE"'|g;' "$K8S/deployment.sample.yaml" > "$K8S/deployment.yaml"
kubectl apply -f "$K8S/deployment.yaml" --namespace="$KUBE_NAMESPACE"
kubectl apply -f "$K8S/service.yaml" --namespace="$KUBE_NAMESPACE"





