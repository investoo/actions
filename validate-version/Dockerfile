# Container image that runs your code
FROM alpine:3.10

# Copies your code files from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY validate.py /validate.py

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["./entrypoint.sh"]