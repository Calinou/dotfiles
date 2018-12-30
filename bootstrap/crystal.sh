#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Crystal

tmp="$(mktemp)"
curl -fsSL "https://github.com/crystal-lang/crystal/releases/download/0.26.1/crystal-0.26.1-1-linux-x86_64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/crystal/" "$HOME/.local/bin/crystal"
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt"/crystal* "$HOME/.local/opt/crystal"

ln -s "$HOME/.local/opt/crystal/bin/crystal" "$HOME/.local/bin/crystal"
