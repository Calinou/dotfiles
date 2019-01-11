#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install ShellCheck

tmp="$(mktemp)"
curl -fsSL "https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz" \
    -o "$tmp"
tar xf "$tmp" "shellcheck-stable/shellcheck" --strip-components=1 --one-top-level="$HOME/.local/bin/"
rm "$tmp"
