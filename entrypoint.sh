#!/bin/sh -l

env REPOSITORY="${GITHUB_REPOSITORY}" COMMIT="${GITHUB_SHA}" ./upload-lsif.sh "$1"
