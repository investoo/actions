#!/bin/sh -l

git fetch origin master

python --version
eval "ls"

python ./validate.py