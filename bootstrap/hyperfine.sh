#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hyperfine

VERSION="1.6.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/sharkdp/hyperfine/releases/download/v$VERSION/hyperfine-v$VERSION-x86_64-unknown-linux-gnu.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "hyperfine-v$VERSION-x86_64-unknown-linux-gnu/hyperfine" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
