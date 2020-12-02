#!/usr/bin/env bash
set -e

if ! which thriftfmt </dev/null >/dev/null 2>&1; then
    echo "thriftfmt not found, run: GO111MODULE=off go get -u github.com/zerosnake0/gothrift/cmd/thriftfmt"
    exit 1
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
