#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/npm_config.sh

./actions-repository/utils/npm_install.sh

if [ $NEEDS_DOCKER = true ]; then
  docker-compose up -d
  echo "Docker is up"
  echo "Ultimate signed commit"
  echo "docker-compose.yml: "
  cat ./docker-compose.yml
  echo "package.json: "
  cat ./package.json
  echo "the project name is $GH_PROJECT_NAME"
  echo "running echo within docker: "
  docker-compose run --rm $GH_PROJECT_NAME echo "testing"
  echo "running ls within docker: "
  docker-compose run --rm $GH_PROJECT_NAME echo "testing"
  echo "running npm test"
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi 