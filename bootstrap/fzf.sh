#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install fzf

tmp="$(mktemp)"
curl -fsSL "https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz" \
    -o "$tmp"
tar xf "$tmp" -C "$HOME/.local/bin/"
rm "$tmp"
