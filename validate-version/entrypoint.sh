#!/bin/sh -l
git fetch origin master

python /validate.py "$(git show origin/master:package.json)"