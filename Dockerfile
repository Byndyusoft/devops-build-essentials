FROM docker:27.2.0-dind-alpine3.20

LABEL maintainer "@Byndyusoft"

RUN mkdir -p /etc/docker/ && echo '{"registry-mirrors": ["https://mirror.gcr.io"]}' > /etc/docker/daemon.json

RUN apk update --no-cache && apk upgrade --no-cache \
    && apk add --no-cache --upgrade make curl jq bash twine \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing mono \
    && curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe \
    && echo 'alias nuget="mono /usr/local/bin/nuget.exe"' >> ~/.bashrc \
    && cert-sync /etc/ssl/certs/ca-certificates.crt
