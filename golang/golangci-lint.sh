#!/usr/bin/env bash
set -e

if [ -n "${VERBOSE}" ]; then
	set -x
fi

if ! which golangci-lint </dev/null >/dev/null 2>&1; then
	echo "Downloading golangci-lint..."
	TEMP_DIR=$(mktemp -d)
	(cd "${TEMP_DIR}" && GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.46.2)
	rm -r "${TEMP_DIR}"
fi

golangci-lint run --allow-parallel-runners "$@"
