#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install lab

VERSION="0.16.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/zaquestion/lab/releases/download/v$VERSION/lab_${VERSION}_linux_amd64.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "lab" --one-top-level="$HOME/.local/bin/"
rm "$tmp"
