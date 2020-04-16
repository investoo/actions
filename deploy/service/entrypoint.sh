#!/bin/sh -l

echo $TESTING_BEAU

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh

./actions-repository/utils/npm_config.sh

./actions-repository/utils/gcloud_deploy_appengine.sh