#!/bin/bash

set -ex

REMOTE_REF="${GITHUB_REF/refs\//refs\/remotes\/}"
CLONE_ABS_PATH="${GITHUB_WORKSPACE}/${CLONE_PATH}"

/bin/echo -e '::group::\x1b[32mCloning repository...\x1b[0m'
git clone --progress --no-checkout --filter=tree:0 "${SERVER_URL}/${REPOSITORY}" "$CLONE_ABS_PATH"
git config --global --add gc.auto 0
git config --global --add safe.directory "$CLONE_ABS_PATH"
echo "::endgroup::"

/bin/echo -e '::group::\x1b[32mFetching repository refs...\x1b[0m'
cd "$CLONE_ABS_PATH"
git fetch --prune --progress --filter=tree:0 origin \
    +refs/heads/*:refs/remotes/origin/* \
    +${GITHUB_REF}:"${REMOTE_REF}"
echo "::endgroup::"

/bin/echo -e '::group::\x1b[32mChecking out repository...\x1b[0m'
git checkout --progress --force "${REMOTE_REF}"
echo "::endgroup::"
