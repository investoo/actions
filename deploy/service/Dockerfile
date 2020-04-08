FROM investoo/gcloud-sdk

ARG NPM_TOKEN

WORKDIR /app
COPY . /app
COPY entrypoint.sh /app/entrypoint.sh

RUN echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" > .npmrc

ENTRYPOINT ["/entrypoint.sh"]