#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install DBeaver

tmp="$(mktemp)"
curl -fsSL "https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/dbeaver/" "$HOME/.local/bin/dbeaver"
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"

ln -s "$HOME/.local/opt/dbeaver/dbeaver" "$HOME/.local/bin/dbeaver"
