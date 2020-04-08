#!/bin/sh -l

npm config set //registry.npmjs.org/:_authToken ${NPM_TOKEN_READ}
npm ci
npm run build