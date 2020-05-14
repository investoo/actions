#!/bin/sh -l

echo "Deploying app to Cloud Functions"

set -x -o nounset -o errexit

test -f .env.yaml || touch .env.yaml
envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < .env.yaml > .env_generated.yaml

if [ $TRIGGER = HTTP ]; then
  gcloud functions deploy ${GH_PROJECT_NAME} --entry-point=${ENTRY_POINT} --runtime=${RUNTIME} --region=${REGION} --memory=${MEMORY} --timeout=${TIMEOUT:-120} --trigger-http --env-vars-file=.env_generated.yaml
elif [ $TRIGGER = TOPIC ]; then
  gcloud functions deploy ${GH_PROJECT_NAME} --entry-point=${ENTRY_POINT} --runtime=${RUNTIME} --region=${REGION} --memory=${MEMORY} --timeout=${TIMEOUT:-120} --trigger-topic=${TRIGGER_TOPIC} --env-vars-file=.env_generated.yaml
else
  echo "Trigger ${TRIGGER} not found"
  exit 1
fi