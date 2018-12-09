#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install PowerShell

tmp="$(mktemp)"
curl -fsSL "https://github.com/PowerShell/PowerShell/releases/download/v6.2.0-preview.2/powershell-6.2.0-preview.2-linux-x64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/powershell/"
mkdir -p "$HOME/.local/opt/powershell/"
tar xf "$tmp" -C "$HOME/.local/opt/powershell/"
rm "$tmp"

ln -s "$HOME/.local/opt/powershell/pwsh" "$HOME/.local/bin/pwsh"
