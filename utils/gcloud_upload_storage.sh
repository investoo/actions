#!/bin/sh -l

echo "Uploading files to Google Bucket"

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

TARGET_VERSION=$(python -c "import json; print json.load(open('package.json'))['version']")

MAJOR_VERSION="${TARGET_VERSION%%.*}"

gsutil -m cp -r -z dist gs://"${GCLOUD_BUCKET_NAME}"/"${GH_PROJECT_NAME}"/v"${MAJOR_VERSION}"/