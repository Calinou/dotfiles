#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hexyl

VERSION="0.6.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/sharkdp/hexyl/releases/download/v$VERSION/hexyl-v$VERSION-x86_64-unknown-linux-musl.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "hexyl-v$VERSION-x86_64-unknown-linux-musl/hexyl" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
