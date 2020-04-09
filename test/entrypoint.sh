#!/bin/sh -l

NEEDS_DOCKER=$1

npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN
npm ci

if [ $NEEDS_DOCKER == true ]; then
  curl -L --fail https://github.com/docker/compose/releases/download/1.24.0/run.sh -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose up -d
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi