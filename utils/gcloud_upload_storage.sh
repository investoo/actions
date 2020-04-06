#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

TARGET_VERSION=$(python -c "import json; print json.load(open('package.json'))['version']")
# [[ $TARGET_VERSION =~ ([0-9]+)\.[0-9]+ ]]

echo $TARGET_VERSION
MAJOR_VERSION_FOLDER="${BASH_REMATCH[1]}"

echo "gs://${BUCKET_NAME}/${CI_PROJECT_NAME}/v${MAJOR_VERSION_FOLDER}/"
# gsutil -m cp -r -z dist/* gs://${BUCKET_NAME}/${CI_PROJECT_NAME}/v${MAJOR_VERSION_FOLDER}/
exit 0