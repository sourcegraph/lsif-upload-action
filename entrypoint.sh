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
    "-root=${ROOT}" \
    "-github-token=${GITHUB_TOKEN}" \
    "-file=$1"

exitCode="$?"
if [ "$IGNORE_FAILURE" = "true" ]; then
    exit 0
else
    exit "$exitCode"
fi
