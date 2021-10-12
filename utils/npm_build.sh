#!/bin/sh -l

echo "Running NPM Build command"

npm run build -- --mode "${BUILD_MODE}"