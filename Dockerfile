FROM alpine:3.10

ENV CLI_VERSION=3.10.9
ENV DOWNLOAD_URL="https://github.com/sourcegraph/src-cli/releases/download/${CLI_VERSION}/src_linux_amd64"

RUN apk add --no-cache \
    # Needed to install binary
    curl \
    # Needed by `src lsif upload` to populate defaults
    git=2.22.2-r0

RUN set -ex && \
    curl -s "${DOWNLOAD_URL}" > /usr/bin/src && \
    chmod +x /usr/bin/src


LABEL version="0.1.0"
LABEL repository="http://github.com/sourcegraph/lsif-upload-action"
LABEL homepage="http://github.com/sourcegraph/lsif-upload-action"
LABEL maintainer="Sourcegraph Support <support@sourcegraph.com>"

LABEL "com.github.actions.name"="Sourcegraph LSIF Uploader"
LABEL "com.github.actions.description"="Upload LSIF data to a Sourcegraph instance"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="purple"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
