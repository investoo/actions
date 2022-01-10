#!/bin/sh -l

echo "Creating .npmrc"

echo "
//npm.pkg.github.com/:_authToken=${NPM_TOKEN}
" > .npmrc

echo "Logging .npmrc contents"

cat .npmrc
