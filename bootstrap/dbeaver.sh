#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install DBeaver

if ! command -v dbeaver > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" \
      -o "$tmp"
  rm -rf "$HOME/.local/opt/dbeaver/"
  tar xf "$tmp" -C "$HOME/.local/opt/"
  rm "$tmp"

  ln -s "$HOME/.local/opt/dbeaver/dbeaver" "$HOME/.local/bin/dbeaver"
fi
