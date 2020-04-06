#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

IS_PROD=$1

if [ $IS_PROD ]; then
    export GCLOUD_SERVICE_KEY=$GCLOUD_SERVICE_KEY_PROD
    export GOOGLE_PROJECT_ID=$GCLOUD_PROJECT_ID_PROD
else
    export GCLOUD_SERVICE_KEY=$GCLOUD_SERVICE_KEY_STAGING
    export GOOGLE_PROJECT_ID=$GCLOUD_PROJECT_ID_STAGING
fi

gcloud auth activate-service-account --key-file=${GCLOUD_SERVICE_KEY}
gcloud config set project ${GOOGLE_PROJECT_ID}
gcloud config set compute/zone ${GCLOUD_ZONE}
