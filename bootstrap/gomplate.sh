#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install gomplate

VERSION="3.5.0"

curl -fsSL "https://github.com/hairyhenderson/gomplate/releases/download/v$VERSION/gomplate_linux-amd64" \
    -o "$HOME/.local/bin/gomplate"
chmod +x "$HOME/.local/bin/gomplate"
