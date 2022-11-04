#!/bin/bash

set -Eeuo pipefail

APP_NAME="Alist"

REPO_URL="https://api.github.com/repos/alist-org/alist/releases/latest"

LATEST_VER=$( curl -s -L $REPO_URL | jq -r .tag_name | sed 's/^v//')
echo $LATEST_VER
CURRENT_VER=$( cat VERSION)

if [ "$LATEST_VER" != "$CURRENT_VER" ];then
    echo $LATEST_VER > VERSION
    echo "$APP_NAME new version->$LATEST_VER was detected. Please rebuild the image."
else
    echo "$CURRENT_VER is the latest version."
fi
