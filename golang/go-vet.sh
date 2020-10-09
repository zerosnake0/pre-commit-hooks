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

dirs=$(echo "${gofiles[@]}" | xargs -n1 dirname | sort -u)
pkg=$(go list -m)
for dir in ${dirs}; do
    go vet "${pkg}/${dir}"
done
