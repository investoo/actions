#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
npm ci

npm run build -- --mode ${BUILD_MODE}