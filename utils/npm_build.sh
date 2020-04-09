#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
npm ci

echo $BUILD_MODE


if [$BUILD_MODE != 'production']; then
  echo $BUILD_MODE
#   npm run build -- --mode ${BUILD_MODE}
else
 echo "no build mode"
#   npm run build
fi