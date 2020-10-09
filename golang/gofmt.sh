#!/usr/bin/env bash
set -e

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
    echo "formatting ${file}"
    if [[ -n $(gofmt -l -w "${file}") ]]; then
        code=1
    fi
done

exit ${code}
