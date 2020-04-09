FROM investoo/gcloud-sdk

COPY --from=library/docker:latest /usr/local/bin/docker /usr/bin/docker
COPY --from=docker/compose:latest /usr/local/bin/docker-compose /usr/bin/docker-compose

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]