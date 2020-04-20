#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/npm_config.sh

./actions-repository/utils/npm_install.sh

if [ $NEEDS_DOCKER = true ]; then
  pwd
  ls ./
  docker-compose run --workdir /github/workspace --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi 