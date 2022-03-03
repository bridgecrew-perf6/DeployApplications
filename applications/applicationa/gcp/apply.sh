#!/usr/bin/env bash
set -e # Exit if error is detected during pipeline execution

GCP="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PWD=$(pwd)
cd "$GCP"/../k8s/ || exit

echo "***** Applying  $APPLICATION deployment  *****"

sed 's|__IMAGE_TAG__|'"$IMAGE"'|g;' deployment.sample.yaml > deployment.yaml
kubectl apply -f deployment.yaml --namespace="$KUBE_NAMESPACE"

kubectl get svc applicationa -n "$KUBE_NAMESPACE" 2>/dev/null || kubectl expose deployment applicationa --port=5001 --target-port=80 -n "$KUBE_NAMESPACE" --type=LoadBalancer
#kubectl apply -f service.yaml --namespace="$KUBE_NAMESPACE" TODO

cd "$PWD" || exit




