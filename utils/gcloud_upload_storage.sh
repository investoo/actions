#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

export BUCKET_NAME=$BUCKET_NAME_PROD

TARGET_VERSION=$(python -c "import json; print json.load(open('package.json'))['version']")
[[ $TARGET_VERSION =~ ([0-9]+)\.[0-9]+ ]]
MAJOR_VERSION_FOLDER="${BASH_REMATCH[1]}"
echo "gs://${BUCKET_NAME}/${PROJECT_NAME}/"
# gsutil -m cp -r -z dist/* gs://${BUCKET_NAME}/${PROJECT_NAME}/
