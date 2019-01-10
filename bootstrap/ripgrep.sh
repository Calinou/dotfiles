#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install ripgrep

tmp_archive="$(mktemp)"
tmp_dir="$(mktemp -d)"
curl -fsSL "https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz" \
    -o "$tmp_archive"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="$tmp_dir/"
mv "$tmp_dir/rg" "$HOME/.local/bin/rg"
mv "$tmp_dir/complete/_rg" "$HOME/.zsh/completion/_rg"
rm -rf "$tmp_archive" "${tmp_dir:?}/"
