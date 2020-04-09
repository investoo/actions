#!/bin/sh -l

echo "Deploying app to App Engine"

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
echo ../../app/dispatch/${DEPLOY_ENV}.yml > dispatch.yml

cat ../../app/dispatch/${DEPLOY_ENV}.yml
echo "nice"
cat dispatch.yml

# envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < "deploy/${DEPLOY_ENV}/app.yml" > app_generated.yml

# gcloud app deploy app_generated.yml
# gcloud app deploy dispatch.yml