#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh

./actions-repository/utils/gcloud_deploy_app.sh