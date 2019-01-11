#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hexyl

tmp="$(mktemp)"
curl -fsSL "https://github.com/sharkdp/hexyl/releases/download/v0.3.1/hexyl-v0.3.1-x86_64-unknown-linux-musl.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "hexyl-v0.3.1-x86_64-unknown-linux-musl/hexyl" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
