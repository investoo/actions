#!/bin/sh -l

echo "Creating .npmrc"

echo "
@investoo:registry=https://npm.pkg.github.com/investoo
//npm.pkg.github.com/:_authToken=${NPM_TOKEN}
" > .npmrc
