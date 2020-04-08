#!/bin/sh -l

echo "Deploying app to App Engine"

set -x -o nounset -o errexit
unset CLOUDSDK_CORE_PROJECT

touch .npmrc
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN_READ}" > .npmrc

echo $DEPLOY_ENV
cat "deploy/${DEPLOY_ENV}/app.yml"
# envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < app.yml > app_generated.yml
# ls
# cat app_generated.yml
# cat .npmrc

# gcloud app deploy app_generated.yml
# gcloud app deploy dispatch.yml