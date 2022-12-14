#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail

[ -n "${DEBUG:+1}" ] && set -x

# Load libraries
. /opt/easysoft/scripts/liblog.sh
. /opt/easysoft/scripts/libeasysoft.sh

print_welcome_page

if [ $# -gt 0 ]; then
    exec "$@"
else
    ALIST_ADMIN_PASSWORD=${DEFAULT_ADMIN_PASSWORD:-qucheng123}

    /apps/alist/alist server --no-prefix
fi
