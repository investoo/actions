#!/bin/sh -l

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git python

git fetch origin master

python --version

python validate.py