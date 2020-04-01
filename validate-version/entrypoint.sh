#!/bin/sh -l
git fetch origin master

eval "ls"
eval "find / validate.py"
python validate.py "$(git show origin/master:package.json)"