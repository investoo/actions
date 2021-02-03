#!/bin/sh -l

echo "Deploying app to Firebase"

set -x -o nounset -o errexit

if [ "$DEPLOY_ENV" = prod ]; then
  envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < .env > .env
else
  envsubst "$(env | cut -d= -f1 | sed -e 's/^/$/')" < .env.staging > .env.staging
fi

export GOOGLE_PROJECT_ID=$GCLOUD_PROJECT_ID

npx firebase use --add "${GOOGLE_PROJECT_ID}" --token "$FIREBASE_TOKEN"
npx firebase target:apply hosting "${GH_PROJECT_NAME}" "${GH_PROJECT_NAME}-${DEPLOY_ENV}"
npx firebase deploy --token "$FIREBASE_TOKEN" --only hosting:"${GH_PROJECT_NAME}"
