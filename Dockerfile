FROM golang:1.6.2-alpine
MAINTAINER Kazumichi Yamamoto <yamamoto.febc@gmail.com>

RUN set -x && apk add --no-cache git make zip gcc linux-headers
RUN go get -u github.com/kardianos/govendor

ADD . $GOPATH/src/github.com/dwarp/cli

WORKDIR $GOPATH/src/github.com/dwarp/cli
RUN make build

ENTRYPOINT $GOPATH/src/github.com/dwarp/cli/bin/dwrap
