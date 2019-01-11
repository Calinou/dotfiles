#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install fd

tmp_archive="$(mktemp)"
tmp_dir="$(mktemp -d)"
curl -fsSL "https://github.com/sharkdp/fd/releases/download/v7.2.0/fd-v7.2.0-x86_64-unknown-linux-gnu.tar.gz" \
    -o "$tmp_archive"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="$tmp_dir/"
mv "$tmp_dir/fd" "$HOME/.local/bin/fd"
mv "$tmp_dir/autocomplete/_fd" "$HOME/.zsh/completion/_fd"
rm -rf "$tmp_archive" "${tmp_dir:?}/"
