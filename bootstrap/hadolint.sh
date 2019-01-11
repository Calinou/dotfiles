#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install hadolint

curl -fsSL "https://github.com/hadolint/hadolint/releases/download/v1.15.0/hadolint-Linux-x86_64" \
    -o "$HOME/.local/bin/hadolint"
chmod +x "$HOME/.local/bin/hadolint"
