#!/bin/sh -l

npm config set //npm.pkg.github.com/:_authToken ${NPM_TOKEN}
npm ci