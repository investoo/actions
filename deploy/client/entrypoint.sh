#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/update_env_file.sh

./actions-repository/utils/npm_config.sh

./actions-repository/utils/npm_create_npmrc.sh

./actions-repository/utils/npm_install.sh

./actions-repository/utils/npm_build.sh

./actions-repository/utils/gcloud_deploy_firebase.sh