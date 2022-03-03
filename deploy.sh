#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

