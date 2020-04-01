#!/bin/sh -l

NPM_TOKEN=$1
NEEDS_DOCKER=$2

# Set up NPM packages
npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN
npm ci

if [$NEEDS_DOCKER]
then
  docker-compose up -d
  docker-compose run --rm partners npm run test
else
  npm run test
fi