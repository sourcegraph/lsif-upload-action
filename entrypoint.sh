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

REPOSITORY="github.com/${GITHUB_REPOSITORY}"
if [ -z "$REPOSITORY_OVERRIDE" ]; then
    REPOSITORY="$REPOSITORY_OVERRIDE"
fi

env src lsif upload \
    "-file=${IN}" \
    "-repo=${REPOSITORY}" \
    "-commit=${GITHUB_SHA}" \
    "-root=${ROOT}" \
    "-github-token=${GITHUB_TOKEN}"
