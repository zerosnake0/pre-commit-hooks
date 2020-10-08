#!/usr/bin/env bash
set -e

go mod tidy

git diff --quiet --exit-code -- go.sum go.mod
