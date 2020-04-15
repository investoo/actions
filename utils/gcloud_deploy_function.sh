#!/bin/sh -l

echo "Deploying app to Cloud Functions"

set -x -o nounset -o errexit

echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc

if [ $TRIGGER = HTTP ]; then
  gcloud functions deploy ${GH_PROJECT_NAME} --entry-point=${ENTRY_POINT} --runtime=${RUNTIME} --region=${REGION} --memory=${MEMORY} --trigger-http
elif [ $TRIGGER = TOPIC ]; then
  gcloud functions deploy ${GH_PROJECT_NAME} --entry-point=${ENTRY_POINT} --runtime=${RUNTIME} --region=${REGION} --memory=${MEMORY} --trigger-topic=${TRIGGER_TOPIC}
else
  echo "Trigger ${TRIGGER} not found"
  exit 1
fi