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

env sourcegraph-cli lsif upload \
    "-file=${IN}" \
    "-repo=github.com/${GITHUB_REPOSITORY}" \
    "-commit=${GITHUB_SHA}" \
    "-github-token=${GITHUB_TOKEN}"
