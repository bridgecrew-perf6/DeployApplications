#!/bin/bash

echo "-----  Running deploy step ENVIRONMENT=$ENVIRONMENT APPLICATION=$APPLICATION IMAGE=$IMAGE NAMESPACE=$NAMESPACE-----"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cat "$DIR/test"

echo "Running deploy step with following parameters KUBE_CONTEXT = $KUBE_CONTEXT, NAMESPACE=$NAMESPACE"
if [ -n "$APPLICATION" ]; then
  APPLY_SCRIPT="${DIR}"/applications/"${APPLICATION}"/gcp/apply.sh
  if [ -f "${APPLY_SCRIPT}" ] ; then
    bash "$APPLY_SCRIPT"
  else
    echo  "Error: Invalid path to apply deployment $APPLY_SCRIPT"
  fi
else
  echo "Error, APPLICATION is not set"
fi

echo "-----  End deploy step... -----"