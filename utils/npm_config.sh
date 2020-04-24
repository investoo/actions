#!/bin/sh -l

echo "Setting NPM Config"

npm config set //npm.pkg.github.com/:_authToken ${NPM_TOKEN}
