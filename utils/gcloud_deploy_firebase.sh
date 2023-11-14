#!/bin/sh -l

echo "Deploying app to Firebase"

set -x -o nounset -o errexit

set -o xtrace

export GOOGLE_PROJECT_ID=$GCLOUD_PROJECT_ID

echo "npx firebase use --add '${GOOGLE_PROJECT_ID}' --token '1//03waaXqZ1gJCGCgYIARAAGAMSNwF-L9IrU-Y6s6QD6ooBjc0Zj7AWKMUmPUbWmwwu4-m6kfAmK5AARAMPwrS-EvxcGPcOdJ4aIa8'"
npx firebase use --add "${GOOGLE_PROJECT_ID}" --token "1//03waaXqZ1gJCGCgYIARAAGAMSNwF-L9IrU-Y6s6QD6ooBjc0Zj7AWKMUmPUbWmwwu4-m6kfAmK5AARAMPwrS-EvxcGPcOdJ4aIa8"
echo "npx firebase target:apply hosting '${GH_PROJECT_NAME}' '${GH_PROJECT_NAME}-${DEPLOY_ENV}'"
npx firebase target:apply hosting "${GH_PROJECT_NAME}" "${GH_PROJECT_NAME}-${DEPLOY_ENV}"
echo "npx firebase deploy --token '1//03waaXqZ1gJCGCgYIARAAGAMSNwF-L9IrU-Y6s6QD6ooBjc0Zj7AWKMUmPUbWmwwu4-m6kfAmK5AARAMPwrS-EvxcGPcOdJ4aIa8' --only hosting:'${GH_PROJECT_NAME}'"
npx firebase deploy --token "1//03waaXqZ1gJCGCgYIARAAGAMSNwF-L9IrU-Y6s6QD6ooBjc0Zj7AWKMUmPUbWmwwu4-m6kfAmK5AARAMPwrS-EvxcGPcOdJ4aIa8" --only hosting:"${GH_PROJECT_NAME}"

