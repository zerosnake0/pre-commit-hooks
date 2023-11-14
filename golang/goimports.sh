#!/usr/bin/env bash
set -e

if [ -n "${VERBOSE}" ]; then
	set -x
fi

if ! which goimports </dev/null >/dev/null 2>&1; then
	echo "Downloading goimports..."
	TEMP_DIR=$(mktemp -d)
	(cd "${TEMP_DIR}" && GO111MODULE=on go install golang.org/x/tools/cmd/goimports@latest)
	rm -r "${TEMP_DIR}"
fi

extraargs=()
for i in "$@"; do
	case $i in
	"-"*)
		extraargs+=("$i")
		;;
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
	if [[ -n $(goimports "${extraargs[@]}" -l -w "${file}") ]]; then
		code=1
	fi
done

exit ${code}
