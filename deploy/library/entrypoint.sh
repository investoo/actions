#!/bin/sh -l

apt-get update
apt-get install jq

git clone https://github.com/investoo/actions.git actions-repository

./actions-repository/utils/gcloud_login.sh