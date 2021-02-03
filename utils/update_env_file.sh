if [ "$DEPLOY_ENV" = prod ]; then
  envsubst < .env > .env.tmp && mv .env.tmp .env
else
  envsubst < .env.staging > .env.tmp && mv .env.tmp .env.staging
fi
