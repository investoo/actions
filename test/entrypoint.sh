#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/npm_config.sh

./actions-repository/utils/npm_install.sh

if [ $NEEDS_DOCKER = true ]; then
  echo "docker-compose.yml: "
  cat ./docker-compose.yml
  echo "package.json: "
  cat ./package.json
  echo "running ls within docker: "
  echo $(docker-compose run -T --rm $GH_PROJECT_NAME ls ./)
  echo "running npm test"
  docker-compose run --rm $GH_PROJECT_NAME npm run test
else
  npm run test
fi 