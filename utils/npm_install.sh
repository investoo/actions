#!/bin/sh -l

npm config set //npm.pkg.github.com/:_authToken ${NPM_TOKEN}
echo "//npm.pkg.github.com/:_authToken=${NPM_TOKEN}" > .npmrc
npm ci