#!/bin/sh -l

echo "Deploying app to App Engine"

set -x -o nounset -o errexit

unset CLOUDSDK_CORE_PROJECT

cp ../../app/dispatch/"${DEPLOY_ENV}".yml dispatch.yml
[ -e "../../app/cron/${DEPLOY_ENV}.yml" ] && cp ../../app/cron/"${DEPLOY_ENV}".yml cron.yml

envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < "deploy/${DEPLOY_ENV}/app.yml" > app_generated.yml

echo "Using app_generated.yml"
cat app_generated.yml

echo "Using gcloud config: "
gcloud config list --all

echo "Running gcloud app deploy app_generated.yml"
gcloud app deploy app_generated.yml --verbosity=debug

echo "Running gcloud app deploy dispatch.yml"
gcloud app deploy dispatch.yml

if [ -e cron.yml ]; then
  echo "Running gcloud app deploy cron.yml"
  gcloud app deploy cron.yml
fi