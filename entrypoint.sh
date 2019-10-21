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

env sourcegraph-cli lsif upload \
    "-repo=github.com/${GITHUB_REPOSITORY}" \
    "-commit=${GITHUB_SHA}" \
    "-upload-token=${SRC_LSIF_UPLOAD_TOKEN}" \
    "-skip-validation" \
    "-file=$1"
