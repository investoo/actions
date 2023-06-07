FROM investoo/gcloud-sdk

RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]