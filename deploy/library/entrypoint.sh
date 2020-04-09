#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh

./actions-repository/utils/npm_build.sh

./actions-repository/utils/npm_publish.sh

./actions-repository/utils/gcloud_upload_storage.sh