#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/npm_install.sh

./actions-repository/utils/npm_build.sh

if [ $PUBLISH_PACKAGE = true ]; then
  echo "Publishing package"
  ./actions-repository/utils/npm_publish.sh
else
  echo "Package not published"
fi