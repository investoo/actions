#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

$GCLOUD_SERVICE_KEY < keyfile.json

cat keyfile.json

# gcloud auth activate-service-account --key-file=keyfile.json
# gcloud config set project ${GCLOUD_PROJECT_ID}
# gcloud config set compute/zone ${GCLOUD_ZONE}
