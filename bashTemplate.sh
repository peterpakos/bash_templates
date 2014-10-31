#!/bin/bash
#
# Template for bash scripts
# Copyright (C) 2014 Peter Pakos

### Configuration
_VERSION=0.0
_DIR="$(cd "$(dirname "${0}")" && pwd)"
_FILE=$(basename "${0}")

### Functions

function cleanup()
{
	return 0
}

function handle_error()
{
	echo -e "\n${@}" 1>&2
#	cleanup
    exit 1
}

### Runtime

# Exit on error. Append || true if you expect an error.
set -o errexit
set -o errtrace
set -o nounset

# Bash will remember & return the highest exitcode in a chain of pipes.
# This way you can catch the error in case script fails in `script | gzip`.
set -o pipefail

trap 'handle_error "Error in ${_FILE} at line $(( ${LINENO} - 1 )) (exit code ${?})"' ERR
trap 'handle_error "Received signal SIGHUP"' SIGHUP
trap 'handle_error "Received signal SIGINT"' SIGINT
trap 'handle_error "Received signal SIGTERM"' SIGTERM

### Main code

exit 0
