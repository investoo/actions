#!/bin/sh -l

DEPLOYMENT_TARGET=$1
DEPLOYMENT_SUCCESSFUL=$2
GITHUB_REPO_URL=https://github.com/$GITHUB_REPOSITORY
GITHUB_WORKFLOW_URL=$GITHUB_REPO_URL/actions/runs/$GITHUB_RUN_ID
GITHUB_COMMIT_URL=$GITHUB_REPO_URL/commit/$GITHUB_SHA

if [ $DEPLOYMENT_SUCCESSFUL = Success ]; then
  DEPLOYMENT_MESSAGE=":white_check_mark: *Deployment Successful*"
else
  DEPLOYMENT_MESSAGE=":x: *Deployment Failed*"
fi


envsubst < /template.json > message.json

cat message.json

exit 1