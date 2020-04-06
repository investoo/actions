#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

echo "${GCLOUD_SERVICE_KEY}" | base64 -d > "${HOME}/gcloud.json" 

gcloud auth activate-service-account --key-file="${HOME}/gcloud.json" 
# gcloud config set project ${GCLOUD_PROJECT_ID}
# gcloud config set compute/zone ${GCLOUD_ZONE}
