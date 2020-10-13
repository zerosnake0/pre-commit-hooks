#!/usr/bin/env bash
set -e

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
    echo "formatting ${file}"
    if [[ -n $(gofmt -l -w "${file}") ]]; then
        code=1
    fi
done

exit ${code}
