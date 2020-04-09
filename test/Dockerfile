FROM investoo/gcloud-sdk

# COPY --from=library/docker:latest /usr/local/bin/docker /usr/bin/docker
# COPY --from=docker/compose:latest /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN apk add --no-cache py-pip
RUN pip install --no-cache-dir "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]