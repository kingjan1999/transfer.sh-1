# Default to Go 1.23
ARG GO_VERSION=1.23
FROM golang:${GO_VERSION}-alpine as build

# Necessary to run 'go get' and to compile the linked binary
RUN apk add git musl-dev mailcap

ADD ./xkpasswd-words.txt /data/woerter.txt
ADD . /go/src/github.com/kingjan1999/transfer.sh-1

WORKDIR /go/src/github.com/kingjan1999/transfer.sh-1

COPY go.mod go.sum ./

RUN go mod download

COPY . .

# build & install server
RUN CGO_ENABLED=0 go build -tags netgo -ldflags "-X github.com/kingjan1999/transfer.sh-1/cmd.Version=$(git describe --tags) -a -s -w -extldflags '-static'" -o /go/bin/transfersh

ARG PUID=5000 \
    PGID=5000 \
    RUNAS

RUN mkdir -p /tmp/useradd /tmp/empty && \
    if [ ! -z "$RUNAS" ]; then \
    echo "${RUNAS}:x:${PUID}:${PGID}::/nonexistent:/sbin/nologin" >> /tmp/useradd/passwd && \
    echo "${RUNAS}:!:::::::" >> /tmp/useradd/shadow && \
    echo "${RUNAS}:x:${PGID}:" >> /tmp/useradd/group && \
    echo "${RUNAS}:!::" >> /tmp/useradd/groupshadow; else touch /tmp/useradd/unused; fi

FROM scratch AS final
LABEL maintainer="Andrea Spacca <andrea.spacca@gmail.com>"
ARG RUNAS

COPY --from=build /etc/mime.types /etc/mime.types
COPY --from=build /tmp/empty /tmp
COPY --from=build /tmp/useradd/* /etc/
COPY --from=build --chown=${RUNAS}  /go/bin/transfersh /go/bin/transfersh
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /data/woerter.txt /data/woerter.txt

USER ${RUNAS}

ENV PROVIDER local
ENV BASEDIR /data/
ENV WORDS_PATH /data/woerter.txt

ENTRYPOINT ["/go/bin/transfersh", "--listener", ":8080"]

EXPOSE 8080
