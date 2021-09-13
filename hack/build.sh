#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

ROOT=$(unset CDPATH && cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)
cd $ROOT

GIT_REPO=https://github.com/jedisct1/dsvpn.git

tmpdir=$(mktemp -d)
trap "rm -rf $tmpdir" EXIT

echo "Checking out $GIT_REPO into $tmpdir"
cd $tmpdir
git init
git fetch --tags --progress $GIT_REPO +refs/heads/*:refs/remotes/origin/*
refs="master $(git tag -l)"

cd $ROOT

echo "info: building images for following git re