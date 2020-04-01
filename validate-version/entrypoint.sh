#!/bin/sh -l

git fetch origin master

python --version

python validate.py