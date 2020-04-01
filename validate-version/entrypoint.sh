#!/bin/sh -l
git fetch origin master

eval "ls /"
python /validate.py "$(git show origin/master:package.json)"