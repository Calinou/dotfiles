#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hadolint

VERSION="1.18.0"

curl -fsSL "https://github.com/hadolint/hadolint/releases/download/v$VERSION/hadolint-Linux-x86_64" \
    -o "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
