#!/bin/bash
#
# Template for bash scripts
#
# Copyright © 2015 Peter Pakos

### Variables

_VERSION=0.0
_DIR="$(cd "$(dirname "${0}")" && pwd)"
_FILE=$(basename "${0}")

### Functions

cleanup() {
  return 0
}

err() {
  echo "[$(date +'%d/%m/%Y %H:%M:%S')]: $@" >&2
  cleanup
  exit 1
}

### Runtime

# Exit on error. Append || true if you expect an error.
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

trap 'err "Error in ${_FILE} at line $(( ${LINENO} - 1 )) (exit code ${?})"' ERR
trap 'err "Received signal SIGHUP"' SIGHUP
trap 'err "Received signal SIGINT"' SIGINT
trap 'err "Received signal SIGTERM"' SIGTERM

### Main code

exit 0
