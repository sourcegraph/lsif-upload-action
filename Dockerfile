FROM golang:1.13.1-alpine3.10 as builder

# The commit at which to build the sourcegraph cli
ENV CLI_COMMIT=6c3a47ba6db6c1f504e95e005ed887be271f636c
ENV CLONE_URL="https://github.com/sourcegraph/src-cli.git"

RUN apk add --no-cache git=2.22.2-r0

WORKDIR /go/src/github.com/sourcegraph/src-cli
RUN git clone "${CLONE_URL}" . && \
    git checkout -q "${CLI_COMMIT}" && \
    go install ./cmd/src

FROM alpine:3.10

# Needed by `src lsif upload` to populate defaults.
RUN apk add --no-cache git=2.22.2-r0

LABEL version="0.1.0"
LABEL repository="http://github.com/sourcegraph/lsif-upload-action"
LABEL homepage="http://github.com/sourcegraph/lsif-upload-action"
LABEL maintainer="Sourcegraph Support <support@sourcegraph.com>"

LABEL "com.github.actions.name"="Sourcegraph LSIF Uploader"
LABEL "com.github.actions.description"="Upload LSIF data to a Sourcegraph instance"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="purple"

COPY --from=builder /go/bin/src /usr/bin/sourcegraph-cli
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
