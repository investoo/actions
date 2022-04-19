#!/bin/sh -l

git --version

git config --global safe.directory "$GITHUB_WORKSPACE"

whoami

git fetch origin master

python /validate.py "$(git show origin/master:package.json)"