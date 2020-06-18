FROM alpine:3.10.0

LABEL NAME="bdenisenko/docker-in-docker-socks"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="Borys Denysenko"

RUN apk update && apk add openrc && apk add docker
#RUN service docker start
RUN apk add py-pip python3-dev libffi-dev openssl-dev gcc libc-dev make docker-compose

RUN adduser -SDHs /sbin/nologin dockremap
RUN addgroup -S dockremap
RUN echo dockremap:$(cat /etc/passwd|grep dockremap|cut -d: -f3):65536 >> /etc/subuid
RUN echo dockremap:$(cat /etc/passwd|grep dockremap|cut -d: -f4):65536 >> /etc/subgid

COPY ["daemon.json", "./etc/docker/daemon.json"]

RUN rc-update add docker boot

ENTRYPOINT [ "dockerd" ]
