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

# Add debug information
echo "Debug Information:"
echo "GitHub Repository URL: $GITHUB_REPO_URL"
echo "GitHub Workflow URL: $GITHUB_WORKFLOW_URL"
echo "GitHub Commit URL: $GITHUB_COMMIT_URL"
echo "Deployment Status: $DEPLOYMENT_STATUS"
echo "Deployment Message: $DEPLOYMENT_MESSAGE"
echo "Contents of message.json:"
cat message.json

# Debugging curl
curl -v POST -H 'Content-type: application/json' --data '@message.json' https://hooks.slack.com/services/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
