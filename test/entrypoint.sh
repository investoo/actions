#!/bin/sh -l

NEEDS_DOCKER=$1

# Set up NPM packages
npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN_READ
npm ci

if [$NEEDS_DOCKER]
then
  docker-compose up -d
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi