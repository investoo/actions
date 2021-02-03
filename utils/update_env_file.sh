echo "Updating .env file"

export -p

if [ "$DEPLOY_ENV" = prod ]; then
  envsubst < .env > .env.tmp && mv .env.tmp .env
  cat .env
else
  envsubst < .env.staging > .env.tmp && mv .env.tmp .env.staging
  cat .env.staging
fi
