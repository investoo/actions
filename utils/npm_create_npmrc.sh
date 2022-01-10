#!/bin/sh -l

echo "Creating .npmrc"

# The 'registry=https://npm.pkg.github.com/investoo" line breaks deployment for the 'monitor-failed-registrations' cloud function
echo "
registry=https://npm.pkg.github.com/investoo
//npm.pkg.github.com/:_authToken=${NPM_TOKEN}
" > .npmrc

echo "Logging .npmrc contents"

cat .npmrc
