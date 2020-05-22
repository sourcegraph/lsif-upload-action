#!/bin/sh

if [ -z "${IN}" ]; then
    echo 'file not supplied.'
    exit 1
fi

if [ -z "$GITHUB_REPOSITORY" ]; then
    echo '$GITHUB_REPOSITORY not supplied.'
    exit 1
fi

if [ -z "$GITHUB_SHA" ]; then
    echo '$GITHUB_SHA not supplied.'
    exit 1
fi

if [ -z "$IGNORE_UPLOAD_FAILURE" ]; then
    IGNORE_UPLOAD_FAILIRE="false"
fi

env src lsif upload \
    "-file=${IN}" \
    "-repo=github.com/${GITHUB_REPOSITORY}" \
    "-commit=${GITHUB_SHA}" \
    "-root=${ROOT}" \
    "-ignore-upload-failure=${IGNORE_UPLOAD_FAILURE}" \
    "-github-token=${GITHUB_TOKEN}"
