#!/bin/sh -l

set -x -o nounset -o errexit

echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
gcloud functions deploy ${GH_PROJECT_NAME} --entry-point=handle --runtime=nodejs8 --region=${REGION} --memory=${MEMORY} --trigger-http