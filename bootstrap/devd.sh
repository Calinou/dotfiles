#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install devd

VERSION="0.9"

tmp="$(mktemp)"
curl -fsSL "https://github.com/cortesi/devd/releases/download/v$VERSION/devd-$VERSION-linux64.tgz" \
    -o "$tmp"
tar xf "$tmp" "devd-$VERSION-linux64/devd" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
