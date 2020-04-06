#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

export GCLOUD_SERVICE_KEY=$GCLOUD_SERVICE_KEY
export GOOGLE_PROJECT_ID=$GCLOUD_PROJECT_ID

gcloud auth activate-service-account --key-file=${GCLOUD_SERVICE_KEY}
gcloud config set project ${GOOGLE_PROJECT_ID}
gcloud config set compute/zone ${GCLOUD_ZONE}
