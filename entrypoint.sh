#!/bin/sh

if [ -z "$GITHUB_REPOSITORY" ]; then
    echo '$GITHUB_REPOSITORY not supplied.'
    exit 1
fi

if [ -z "$GITHUB_SHA" ]; then
    echo '$GITHUB_SHA not supplied.'
    exit 1
fi

if [ -z "$1" ]; then
    echo 'file not supplied.'
    exit 1
fi

sourcegraph-cli lsif upload \
    "-repository=${GITHUB_REPOSITORY}" \
    "-commit=${GITHUB_SHA}" \
    "-upload-token=${SRC_LSIF_UPLOAD_TOKEN}" \
    "-file=$1"
