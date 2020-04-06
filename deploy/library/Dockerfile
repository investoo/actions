# Container image that runs your code
FROM investoo/gcloud-sdk

RUN git clone https://github.com/investoo/actions.git
run ls

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY actions/utils /action-utils

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/action-utils/gcloud_login.sh"]