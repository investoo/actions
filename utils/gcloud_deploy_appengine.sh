#!/bin/sh -l

echo "Deploying app to App Engine"

set -x -o nounset -o errexit

"Unsetting CLOUDSDK_CORE_PROJECT: ${CLOUDSDK_CORE_PROJECT}"

unset CLOUDSDK_CORE_PROJECT

cp ../../app/dispatch/${DEPLOY_ENV}.yml dispatch.yml

envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < "deploy/${DEPLOY_ENV}/app.yml" > app_generated.yml

echo "Using app_generated.yml"
cat app_generated.yml

echo "Running gcloud app deploy app_generated.yml"
gcloud app deploy app_generated.yml

echo "Running gcloud app deploy dispatch.yml"
gcloud app deploy dispatch.yml