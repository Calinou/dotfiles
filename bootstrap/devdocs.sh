#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install DevDocs Desktop

VERSION="0.6.9"

tmp="$(mktemp)"
curl -fsSL "https://github.com/egoist/devdocs-desktop/releases/download/v$VERSION/DevDocs-$VERSION.tar.xz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/devdocs/" "$HOME/.local/bin/devdocs"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/devdocs/"
rm "$tmp"

ln -s "$HOME/.local/opt/devdocs/devdocs" "$HOME/.local/bin/devdocs"
