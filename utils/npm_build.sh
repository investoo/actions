#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
npm ci

if [[ -z "${BUILD_MODE}" ]]; then
  npm run build
else
  npm run build -- --mode ${BUILD_MODE}
fi