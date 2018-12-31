#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Google Fonts

git clone --depth 1 \
    "https://github.com/google/fonts.git" \
    "$HOME/.fonts/google-fonts/" || true

# Install Inter UI

tmp="$(mktemp)"
curl -fsSL "https://github.com/rsms/inter/releases/download/v3.1/Inter-UI-3.1.zip" \
    -o "$tmp"
unzip -o "$tmp" "Inter UI (TTF hinted)/*" -d "$HOME/.fonts/"
rm "$tmp"

# Install Noto fonts

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-sans/"
rm "$tmp"

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-serif/"
rm "$tmp"

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoMono-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-mono/"
rm "$tmp"
