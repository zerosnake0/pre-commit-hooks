#!/usr/bin/env bash
set -e

gofiles=()
vetargs=()
for i in "$@"; do
	case $i in
	"vendor/"*) # skip vendor
		;;
	*".pb.go") # skip generated protobuf code
		;;
	"-"*)
		vetargs+=("$i")
		;;
	*)
		gofiles+=("${i}")
		;;
	esac
done

dirs=$(echo "${gofiles[@]}" | xargs -n1 dirname | sort -u)
#pkg=$(go list -m)
for dir in ${dirs}; do
	# we must go into the subdirectory to deal with
	# the condition where go.mod is in subdirectory
	(cd "${dir}" && go vet "${vetargs[@]}" .)
done
