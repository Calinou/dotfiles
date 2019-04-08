#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install bat

VERSION="0.10.0"

tmp_archive="$(mktemp)"
tmp_dir="$(mktemp -d)"
curl -fsSL "https://github.com/sharkdp/bat/releases/download/v$VERSION/bat-v$VERSION-x86_64-unknown-linux-musl.tar.gz" \
    -o "$tmp_archive"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="$tmp_dir/"
mv "$tmp_dir/bat" "$HOME/.local/bin/bat"
rm -rf "$tmp_archive" "${tmp_dir:?}/"
