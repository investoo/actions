#!/bin/sh -l

echo "Creating .npmrc"

echo "
registry=https://npm.pkg.github.com/investoo
//npm.pkg.github.com/:_authToken=${NPM_TOKEN}
" > .npmrc

echo "Logging .npmrc contents"

cat .npmrc
