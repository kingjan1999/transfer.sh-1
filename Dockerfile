FROM golang:1.12-alpine as build
LABEL maintainer="Andrea Spacca <andrea.spacca@gmail.com>"

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/kingjan1999/transfer.sh-1
ADD ./xkpasswd-words.txt /data/woerter.txt

RUN export GO111MODULE=on

# build & install server
WORKDIR /go/src/github.com/kingjan1999/transfer.sh-1
RUN go get -d -v ./...

# Install the package
#RUN go install -v ./...

RUN go build -o /go/bin/transfersh github.com/kingjan1999/transfer.sh-1

FROM golang:1.11-alpine
COPY --from=build /go/bin/transfersh /go/bin/transfersh
COPY --from=build /data/woerter.txt /data/woerter.txt

ENV PROVIDER local
ENV BASEDIR /data/
ENV WORDS_PATH /data/woerter.txt

ENTRYPOINT /go/bin/transfersh --listener :8080 --provider $PROVIDER --basedir $BASEDIR
#ENTRYPOINT ["/go/bin/transfersh", "--listener", ":8080"]

EXPOSE 8080
