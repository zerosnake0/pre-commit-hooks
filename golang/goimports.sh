#!/usr/bin/env bash
set -e

if ! which goimports </dev/null >/dev/null 2>&1; then
    echo "goimports not found, run: GO111MODULE=off go get -u golang.org/x/tools/cmd/goimports"
    exit 1
fi

gofiles=()
for i in "$@"; do
    case $i in
    "vendor/"*) # skip vendor
        ;;
    *".pb.go") # skip generated protobuf code
        ;;
    *)
        gofiles+=("${i}")
        ;;
    esac
done

code=0
for file in "${gofiles[@]}"; do
    echo "running goimports on ${file}"
    if [[ -n $(goimports -l -w "${file}") ]]; then
        code=1
    fi
done

exit ${code}
