#!/bin/bash
set -e

if ! which prototool </dev/null >/dev/null 2>&1; then
    echo "Downloading prototool..."
    TEMP_DIR=$(mktemp -d)
    (cd "${TEMP_DIR}" && GO111MODULE=on go get -u github.com/uber/prototool/cmd/prototool)
    rm -r "${TEMP_DIR}"
fi

prototool "$@"
