#!/bin/sh -l

echo "Installing dependencies and building files"

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN_READ}
npm ci
npm run build