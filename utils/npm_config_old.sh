#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN}
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
