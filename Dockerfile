FROM alpine:3.10

# The compatible version of Sourcegraph
ENV SRC_VERSION=3.8.2

LABEL version="0.1.0"
LABEL repository="http://github.com/sourcegraph/lsif-gh-actions"
LABEL homepage="http://github.com/sourcegraph/lsif-gh-actions"
LABEL maintainer="Sourcegraph Support <support@sourcegraph.com>"

LABEL "com.github.actions.name"="Sourcegraph LSIF Uploader"
LABEL "com.github.actions.description"="Generate LSIF data and upload to Sourcegraph"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="purple"

RUN apk add --no-cache curl

RUN set -ex && \
    curl -s https://github.com/sourcegraph/sourcegraph/blob/v${SRC_VERSION}/lsif/upload.sh > /upload.sh && \
    chmod a+x upload.sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
