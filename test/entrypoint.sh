#!/bin/sh -l

NEEDS_DOCKER=$1

echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN

cat .npmrc

npm ci

if [$NEEDS_DOCKER]; then
  docker-compose up -d
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi