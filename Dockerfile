FROM golang:1.7

ARG git_commit=unknown
LABEL org.cyverse.git-ref="$git_commit"

COPY . /go/src/github.com/cyverse-de/ansible-merge-tool
RUN go install github.com/cyverse-de/ansible-merge-tool

RUN apt-get update && apt-get install -y git ssh

ENTRYPOINT ["ansible-merge-tool"]
CMD ["--help"]
