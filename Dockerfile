# Default to Go 1.12
ARG GO_VERSION=1.12
FROM golang:${GO_VERSION}-alpine as build

# Necessary to run 'go get' and to compile the linked binary
RUN apk add git musl-dev

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/kingjan1999/transfer.sh-1
ADD ./xkpasswd-words.txt /data/woerter.txt
WORKDIR /go/src/github.com/dutchcoders/transfer.sh

ENV GO111MODULE=on

# build & install server
RUN go get -u ./... && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags -a -tags netgo -ldflags '-w -extldflags "-static"' -o /go/bin/transfersh github.com/kingjan1999/transfer.sh-1

FROM scratch AS final
LABEL maintainer="Andrea Spacca <andrea.spacca@gmail.com>"

COPY --from=build  /go/bin/transfersh /go/bin/transfersh
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENV PROVIDER local
ENV BASEDIR /data/
ENV WORDS_PATH /data/woerter.txt

ENTRYPOINT ["/go/bin/transfersh", "--listener", ":8080"]

EXPOSE 8080
