#!/usr/bin/env bash
set -e

if ! which goimports </dev/null >/dev/null 2>&1; then
    echo "goimports not found, run: GO111MODULE=off go get -u golang.org/x/tools/cmd/goimports"
    exit 1
fi

gofiles=()
for file in "$@"; do
    # skip vendor
    if [[ "${file}" == "vendor/"* ]]; then
        continue
    fi
    # skip generated protobuf code
    if [[ "${file}" == *".pb.go" ]]; then
        continue
    fi
    gofiles+=("${file}")
done

code=0
for file in "${gofiles[@]}"; do
    echo "running goimports on ${file}"
    if [[ -n $(goimports -l -w "${file}") ]]; then
        code=1
    fi
done

exit ${code}
