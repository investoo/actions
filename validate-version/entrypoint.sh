#!/bin/sh -l

git config --global safe.directory "$GITHUB_WORKSPACE"

git fetch origin master

python /validate.py "$(git show origin/master:package.json)"