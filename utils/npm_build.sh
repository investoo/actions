#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
npm ci

if [$BUILD_MODE]; then
  npm run build -- --mode ${BUILD_MODE}
else
  npm run build
fi