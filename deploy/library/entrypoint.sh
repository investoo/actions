#!/bin/sh -l

git clone https://github.com/investoo/actions.git actions-repository
echo "hi $1"

./actions-repository/utils/gcloud_login.sh $1