#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Google Fonts

git clone --depth 1 \
    "https://github.com/google/fonts.git" \
    "$HOME/.fonts/google-fonts/" || true

# Install Hack font

HACK_VERSION="3.003"

tmp="$(mktemp)"
curl -fsSL "https://github.com/source-foundry/Hack/releases/download/v$HACK_VERSION/Hack-v$HACK_VERSION-ttf.zip" \
    -o "$tmp"
unzip -jo "$tmp" "ttf/*" -d "$HOME/.fonts/"
rm "$tmp"

# Install IBM Plex

IBM_PLEX_VERSION="1.4.1"

tmp="$(mktemp)"
curl -fsSL "https://github.com/IBM/plex/releases/download/v$IBM_PLEX_VERSION/TrueType.zip" \
    -o "$tmp"
unzip -o "$tmp" "TrueType/*" -d "$HOME/.fonts/"
rm "$tmp"

# Install Inter

INTER_VERSION="3.5"

tmp="$(mktemp)"
curl -fsSL "https://github.com/rsms/inter/releases/download/v$INTER_VERSION/Inter-$INTER_VERSION.zip" \
    -o "$tmp"
unzip -o "$tmp" "Inter (TTF hinted)/*" -d "$HOME/.fonts/"
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
