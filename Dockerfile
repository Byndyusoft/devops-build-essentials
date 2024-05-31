FROM docker:26.1.3-dind-alpine3.20

LABEL maintainer "@Byndyusoft"

RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make git curl jq docker-compose openssl bash \
    && mkdir -p /etc/docker/ && echo '{"registry-mirrors": ["https://mirror.gcr.io"]}' > /etc/docker/daemon.json
