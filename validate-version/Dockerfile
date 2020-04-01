# Container image that runs your code
FROM python:3-alpine

# Installs Git and Python
RUN apk add --no-cache git
RUN git fetch origin master

# Copies your code files from your action repository to the filesystem path `/` of the container
COPY validate.py /validate.py

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/validate.py", "$(git show origin/master:package.json)"]