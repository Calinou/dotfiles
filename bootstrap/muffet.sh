#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Muffet

VERSION="2.3.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/raviqqe/muffet/releases/download/v$VERSION/muffet_${VERSION}_Linux_x86_64.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "muffet" --one-top-level="$HOME/.local/bin/"
rm "$tmp"
