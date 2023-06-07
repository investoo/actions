FROM investoo/gcloud-sdk

RUN apt-get update
RUN apt-get update -y nodejs npm
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]