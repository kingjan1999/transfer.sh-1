FROM golang:1.11-alpine as build
LABEL maintainer="Remco Verhoef <remco@dutchcoders.io>"

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/kingjan1999/transfer.sh-1
ADD ./xkpasswd-words.txt /data/woerter.txt

# build & install server
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
