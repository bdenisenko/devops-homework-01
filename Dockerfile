FROM alpine:latest

LABEL NAME="bdenisenko/docker-in-docker"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="Borys Denysenko"

RUN apk update && apk add docker

ENTRYPOINT [ "/bin/sh" ]
