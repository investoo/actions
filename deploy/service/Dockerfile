FROM google/cloud-sdk

WORKDIR /app
COPY . /app
COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]