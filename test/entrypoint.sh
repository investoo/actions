#!/bin/sh -l

NEEDS_DOCKER=$1

npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN
npm ci

if [ $NEEDS_DOCKER = true ]; then
  ls
  docker-compose up -d
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi