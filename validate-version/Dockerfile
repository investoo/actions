FROM python:3-alpine

RUN apk add --no-cache git

COPY entrypoint.sh /entrypoint.sh
COPY validate.py /validate.py

ENTRYPOINT ["/entrypoint.sh"]