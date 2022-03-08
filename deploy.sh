#!/bin/bash

echo "-----  Running deploy step ENVIRONMENT=$ENVIRONMENT APPLICATION=$APPLICATION IMAGE=$IMAGE NAMESPACE=$NAMESPACE-----"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Set ProjectId per environment
PROJECT_ID_TEST="gitlab-demo-342103"
PROJECT_ID_DEMO="gitlab-demo-342103"
PROJECT_ID_DEV="gitlab-demo-342103"

get_project_id(){
  ENVIRONMENT=$1
  case "$ENVIRONMENT" in
    demo) echo "$PROJECT_ID_DEMO"
       ;;
    test) echo "$PROJECT_ID_TEST"
       ;;
    development) echo "$PROJECT_ID_DEV"
      ;;
  esac

}

PROJECT_ID=$(get_project_id "$ENVIRONMENT")
BUCKET=gs://${PROJECT_ID}-cql-test

echo "Running deploy step with following parameters KUBE_CONTEXT=$KUBE_CONTEXT, NAMESPACE=$NAMESPACE"
if [ -n "$APPLICATION" ]; then
  APPLY_SCRIPT="${DIR}"/applications/"${APPLICATION}"/gcp/apply.sh
  if [ -f "${APPLY_SCRIPT}" ] ; then
    PROJECT_ID=$PROJECT_ID BUCKET=$BUCKET bash "$APPLY_SCRIPT"
  else
    echo  "Error: Invalid path to apply deployment $APPLY_SCRIPT"
  fi
else
  echo "Error, APPLICATION is not set"
fi

echo "-----  End deploy step... -----"