#!/bin/sh -l

echo "Deploying app to App Engine"

sudo apt-get update && sudo apt-get --only-upgrade install google-cloud-sdk-cbt google-cloud-sdk-app-engine-java google-cloud-sdk-app-engine-python google-cloud-sdk-pubsub-emulator google-cloud-sdk-app-engine-go google-cloud-sdk-local-extract google-cloud-sdk-skaffold google-cloud-sdk-cloud-build-local google-cloud-sdk-bigtable-emulator google-cloud-sdk-app-engine-python-extras google-cloud-sdk-anthos-auth google-cloud-sdk-firestore-emulator google-cloud-sdk-datalab google-cloud-sdk kubectl google-cloud-sdk-config-connector google-cloud-sdk-spanner-emulator google-cloud-sdk-datastore-emulator google-cloud-sdk-kubectl-oidc google-cloud-sdk-app-engine-grpc google-cloud-sdk-kpt google-cloud-sdk-minikube

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

# echo "Running gcloud app deploy dispatch.yml"
# gcloud app deploy dispatch.yml

if [ -e cron.yml ]; then
  echo "Running gcloud app deploy cron.yml"
  gcloud app deploy cron.yml
fi
