#!/bin/sh -l

echo "Deploying app to Cloud Functions"

ls

set -x -o nounset -o errexit

test -f .env.yaml || touch .env.yaml 

# envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < .env.yaml > .env_generated.yaml
envsubst < .env.yaml > .env_generated.yaml

echo "contents of .env_generated.yaml"
cat .env_generated.yaml

# gcloud components update

if [ "$TRIGGER" = HTTP ]; then
  gcloud functions deploy "${GH_PROJECT_NAME}" --entry-point="${ENTRY_POINT}" --runtime="${RUNTIME}" --region="${REGION}" --memory="${MEMORY}" --timeout="${TIMEOUT}" --trigger-http --env-vars-file=.env_generated.yaml
elif [ "$TRIGGER" = TOPIC ]; then
  gcloud functions deploy "${GH_PROJECT_NAME}" --entry-point="${ENTRY_POINT}" --runtime="${RUNTIME}" --region="${REGION}" --memory="${MEMORY}" --timeout="${TIMEOUT}" --trigger-topic="${TRIGGER_TOPIC}" --env-vars-file=.env_generated.yaml
else
  echo "Trigger ${TRIGGER} not found"
  exit 1
fi
