#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install gomplate

curl -fsSL "https://github.com/hairyhenderson/gomplate/releases/download/v3.3.1/gomplate_linux-amd64" \
    -o "$HOME/.local/bin/gomplate"
chmod +x "$HOME/.local/bin/gomplate"
