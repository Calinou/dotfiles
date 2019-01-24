#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hyperfine

tmp="$(mktemp)"
curl -fsSL "https://github.com/sharkdp/hyperfine/releases/download/v1.5.0/hyperfine-v1.5.0-x86_64-unknown-linux-gnu.tar.gz" \
    -o "$tmp"
tar xf "$tmp" "hyperfine-v1.5.0-x86_64-unknown-linux-gnu/hyperfine" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
