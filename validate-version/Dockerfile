# Container image that runs your code
FROM python:3-alpine

# Installs Git and Python
RUN apk add --no-cache git

# Copies your code files from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY validate.py /validate.py

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]