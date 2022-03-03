#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "-----  Running pre-deploy step ENVIRONMENT=$ENVIRONMENT APPLICATION=$APPLICATION IMAGE=$IMAGE NAMESPACE=$NAMESPACE... -----"
echo 'Eva test ' > "$DIR/test"
kubectl get pods -n "$NAMESPACE"
kubectl config get-contexts
echo "----- End pre-deploy step... -----"
