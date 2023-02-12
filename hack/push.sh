
#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

ROOT=$(unset CDPATH && cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)
cd $ROOT

if [ -n "${DOCKER_USERNAME:-}" -a -n "${DOCKER_PASSWORD:-}" ]; then
    echo "info: DOCKER_USERNAME & DOCKER_PASSWORD are both set"