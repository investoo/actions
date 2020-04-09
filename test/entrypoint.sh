#!/bin/sh -l

NEEDS_DOCKER=$1

echo $1 
echo $NEEDS_DOCKER

# npm config set //registry.npmjs.org/:_authToken $NPM_TOKEN
# npm ci

if [$NEEDS_DOCKER = true]; then
  echo "docker!"
  # docker-compose up -d
  # docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  echo "no docker!"
  # npm run test
fi

exit 1