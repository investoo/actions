#!/bin/sh -l

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

TARGET_VERSION=$(python -c "import json; print json.load(open('package.json'))['version']")

IFS='.' read -r MAJOR_VERSION string <<EOF
$TARGET_VERSION
EOF

echo $TARGET_VERSION
echo $MAJOR_VERSION

echo "gs://${BUCKET_NAME}/${CI_PROJECT_NAME}/v${MAJOR_VERSION}/"
# gsutil -m cp -r -z dist/* gs://${BUCKET_NAME}/${CI_PROJECT_NAME}/v${MAJOR_VERSION}/
exit 0