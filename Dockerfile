FROM alpine:3.6
MAINTAINER Nikolai Vasilenko

ENV REFRESHED_AT=2017–10–08 \
  HOME=/opt/app/ \
  LANG=en_US.UTF-8 \
  VERSION=0.0.1 \
  REPLACE_OS_VARS=true

RUN apk --update --no-cache add ncurses openssl bash
RUN wget -O dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/v0.4.0/dockerize-alpine-linux-amd64-v0.4.0.tar.gz \
    && tar -C /usr/local/bin -xzf dockerize.tar.gz \
    && rm dockerize.tar.gz

ADD _build/prod/rel/bering/releases/$VERSION/bering.tar.gz $HOME

WORKDIR ${HOME}
CMD ["/bin/sh"]
