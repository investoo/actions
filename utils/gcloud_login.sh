#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

gcloud auth activate-service-account --key-file=${GCLOUD_SERVICE_KEY}
gcloud config set project ${GCLOUD_PROJECT_ID}
gcloud config set compute/zone ${GCLOUD_ZONE}
