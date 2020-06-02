#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Delta

VERSION="0.1.1"

tmp_archive="$(mktemp)"
tmp_dir="$(mktemp -d)"
curl -fsSL "https://github.com/dandavison/delta/releases/download/$VERSION/delta-$VERSION-x86_64-unknown-linux-musl.tar.gz" \
    -o "$tmp_archive"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="$tmp_dir/"
mv "$tmp_dir/delta" "$HOME/.local/bin/delta"
rm -rf "$tmp_archive" "${tmp_dir:?}/"
