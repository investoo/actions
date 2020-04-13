#!/bin/sh -l

DEPLOYMENT_SUCCESSFUL=$2
export DEPLOYMENT_TARGET=$1
export GITHUB_REPO_URL=https://github.com/$GITHUB_REPOSITORY
export GITHUB_WORKFLOW_URL=$GITHUB_REPO_URL/actions/runs/$GITHUB_RUN_ID
export GITHUB_COMMIT_URL=$GITHUB_REPO_URL/commit/$GITHUB_SHA

if [ $DEPLOYMENT_SUCCESSFUL = true ]; then
  export DEPLOYMENT_MESSAGE=":white_check_mark: *Deployment Successful*"
else
  export DEPLOYMENT_MESSAGE=":x: *Deployment Failed*"
fi

envsubst < /template.json > message.json

curl -X POST -H 'Content-type: application/json' --data '@message.json' $SLACK_WEBHOOK_URL

exit 1