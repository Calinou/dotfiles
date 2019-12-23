#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Crystal

VERSION="0.32.1"

tmp="$(mktemp)"
curl -fsSL "https://github.com/crystal-lang/crystal/releases/download/$VERSION/crystal-$VERSION-1-linux-x86_64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/crystal "$HOME/.local/bin/shards"
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt"/crystal* "$HOME/.local/opt/crystal"

ln -s "$HOME/.local/opt/crystal/bin/crystal" "$HOME/.local/bin/crystal"
ln -s "$HOME/.local/opt/crystal/bin/shards" "$HOME/.local/bin/shards"
