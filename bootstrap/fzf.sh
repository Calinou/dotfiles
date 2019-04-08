#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install fzf

VERSION="0.18.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/junegunn/fzf-bin/releases/download/$VERSION/fzf-$VERSION-linux_amd64.tgz" \
    -o "$tmp"
tar xf "$tmp" -C "$HOME/.local/bin/"
rm "$tmp"
