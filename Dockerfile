FROM docker:20.10.16-dind-alpine3.15
LABEL maintainer "@Byndyusoft"
RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make git curl docker-compose openssl bash
