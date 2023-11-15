#!/usr/bin/env bash

set -e

VERSION="0.0.2"

update() {
	echo "Downloading thriftfmt ${VERSION}..."
	local TEMP_DIR
	TEMP_DIR=$(mktemp -d)
	(cd "${TEMP_DIR}" && GO111MODULE=on go install "github.com/zerosnake0/gothrift/cmd/thriftfmt@v${VERSION}")
	rm -r "${TEMP_DIR}"
}

if CURRENT_VERSION=$(thriftfmt -V); then
	if [[ "${CURRENT_VERSION}" != "${VERSION}" ]]; then
		update
	fi
else
	update
fi

files=()
for i in "$@"; do
	case $i in
	*)
		files+=("$i")
		;;
	esac
done

for file in "${files[@]}"; do
	echo "formatting ${file}"
	thriftfmt -w "${file}"
done
