#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install muxed

VERSION="0.8.1"

tmp="$(mktemp)"
curl -fsSL "https://github.com/brianp/muxed/releases/download/$VERSION/muxed-$VERSION-x86_64-unknown-linux-gnu.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "muxed" --one-top-level="$HOME/.local/bin/"
rm "$tmp"
