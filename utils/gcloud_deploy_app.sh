#!/bin/sh -l

echo "Deploying app to App Engine"

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

touch .npmrc
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN_READ}" > ~/.npmrc

envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < "deploy/${DEPLOY_ENV}/app.yml" > app_generated.yml
cp "../../dispatch/${DEPLOY_ENV}.yml" dispatch.yml

ls

gcloud app deploy app_generated.yml
# gcloud app deploy dispatch.yml

exit 1