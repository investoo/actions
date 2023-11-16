#!/bin/sh -l

export GITHUB_REPO_URL=https://github.com/$GITHUB_REPOSITORY
export GITHUB_WORKFLOW_URL=$GITHUB_REPO_URL/actions/runs/$GITHUB_RUN_ID
export GITHUB_COMMIT_URL=$GITHUB_REPO_URL/commit/$GITHUB_SHA

if [ $DEPLOYMENT_SUCCESSFUL = true ]; then
  export DEPLOYMENT_STATUS=Succeeded
  export DEPLOYMENT_MESSAGE=":white_check_mark: *Deployment $DEPLOYMENT_STATUS*"
else
  export DEPLOYMENT_STATUS=Failed
  export DEPLOYMENT_MESSAGE=":x: *$DEPLOYMENT_TARGET deployment $DEPLOYMENT_STATUS*"
fi

envsubst < /template.json > message.json

curl -X POST -H 'Content-type: application/json' --data '@message.json' https://hooks.slack.com/services/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