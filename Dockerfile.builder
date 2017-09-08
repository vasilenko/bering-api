FROM bitwalker/alpine-elixir:1.5.1
MAINTAINER Nikolai Vasilenko

ENV REFRESHED_AT 2017–10–08

RUN apk --update --no-cache add docker make g++

COPY . /build
WORKDIR /build

RUN MIX_ENV=prod mix do deps.get --only prod, compile, release

CMD ["/bin/sh"]
