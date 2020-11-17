#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh

if [ $NPM_OLD = true ]; then
  ./actions-repository/utils/npm_config_old.sh
else
  ./actions-repository/utils/npm_config.sh
  ./actions-repository/utils/npm_create_npmrc.sh
fi


./actions-repository/utils/gcloud_delete_appengine_services.sh

./actions-repository/utils/gcloud_deploy_appengine.sh