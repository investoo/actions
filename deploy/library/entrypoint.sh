#!/bin/sh -l

PUBLISH_PACKAGE=$1

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh

./actions-repository/utils/npm_install.sh

./actions-repository/utils/npm_build.sh


if [ $PUBLISH_PACKAGE = true ]; then
  echo "Should publish"
  echo $PUBLISH_PACKAGE
  # ./actions-repository/utils/npm_publish.sh
  # ./actions-repository/utils/gcloud_upload_storage.sh
fi

echo $PUBLISH_PACKAGE
exit 1