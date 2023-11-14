#!/bin/bash
set -e

if ! which prototool </dev/null >/dev/null 2>&1; then
	echo "Downloading prototool..."
	TEMP_DIR=$(mktemp -d)
	(cd "${TEMP_DIR}" && GO111MODULE=on go install github.com/uber/prototool/cmd/prototool@latest)
	rm -r "${TEMP_DIR}"
fi

prototool "$@"
