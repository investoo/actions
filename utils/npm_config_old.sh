#!/bin/sh -l

echo "old config setup"
npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc

cat .npmrc
