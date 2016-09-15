FROM golang:1.7

ARG git_commit=unknown
ARG version="2.9.0"

LABEL org.cyverse.git-ref="$git_commit"
LABEL org.cyverse.version="$version"

COPY . /go/src/github.com/cyverse-de/ansible-merge-tool
RUN go install github.com/cyverse-de/ansible-merge-tool

RUN apt-get update && apt-get install -y git ssh

ENTRYPOINT ["ansible-merge-tool"]
CMD ["--help"]
