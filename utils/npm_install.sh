#!/bin/sh -l
npm config set //npm.pkg.github.com/:_authToken ${NPM_TOKEN}
echo "registry=https://npm.pkg.github.com/investoo" > .npmrc
echo "//npm.pkg.github.com/:_authToken=${NPM_TOKEN}" > .npmrc
npm ci