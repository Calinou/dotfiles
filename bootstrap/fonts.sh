#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Google Fonts

git clone --depth 1 \
    "https://github.com/google/fonts.git" \
    "$HOME/.fonts/google-fonts/" || true

# Install Cooper Hewitt

tmp="$(mktemp)"
curl -fsSSL "https://github.com/tom10271/cooper-hewitt-fixed-for-windows/archive/master.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/cooper-hewitt/"
rm -f "$tmp"

# Install Hack font

HACK_VERSION="3.003"

tmp="$(mktemp)"
curl -fsSL "https://github.com/source-foundry/Hack/releases/download/v$HACK_VERSION/Hack-v$HACK_VERSION-ttf.zip" \
    -o "$tmp"
unzip -jo "$tmp" "ttf/*" -d "$HOME/.fonts/"
rm -f "$tmp"

# Install JetBrains Mono

JETBRAINS_MONO_VERSION="2.001"

tmp="$(mktemp)"
curl -fsSL "https://github.com/JetBrains/JetBrainsMono/releases/download/v$JETBRAINS_MONO_VERSION/JetBrains.Mono.$JETBRAINS_MONO_VERSION.zip" \
    -o "$tmp"
unzip -jo "$tmp" "JetBrains Mono $JETBRAINS_MONO_VERSION/ttf/*" -d "$HOME/.fonts/jetbrains-mono/"
rm -f "$tmp"

# Install IBM Plex

IBM_PLEX_VERSION="2.0.0"

tmp="$(mktemp)"
curl -fsSL "https://github.com/IBM/plex/releases/download/v$IBM_PLEX_VERSION/TrueType.zip" \
    -o "$tmp"
unzip -o "$tmp" "TrueType/*" -d "$HOME/.fonts/"
rm -f "$tmp"

# Install Inter

INTER_VERSION="3.13"

tmp="$(mktemp)"
curl -fsSL "https://github.com/rsms/inter/releases/download/v$INTER_VERSION/Inter-$INTER_VERSION.zip" \
    -o "$tmp"
unzip -jo "$tmp" "Inter Desktop/*" -d "$HOME/.fonts/"
rm -f "$tmp"

# Install Noto fonts

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-sans/"
rm -f "$tmp"

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-serif/"
rm -f "$tmp"

tmp="$(mktemp)"
curl -fsSL "https://noto-website-2.storage.googleapis.com/pkgs/NotoMono-hinted.zip" \
    -o "$tmp"
unzip -o "$tmp" -d "$HOME/.fonts/noto-mono/"
rm -f "$tmp"

# Install Public Sans

PUBLIC_SANS_VERSION="1.003"

tmp="$(mktemp)"
curl -fsSL "https://github.com/uswds/public-sans/releases/download/v$PUBLIC_SANS_VERSION/public-sans-v$PUBLIC_SANS_VERSION.zip" \
    -o "$tmp"
unzip -j -o "$tmp" -d "$HOME/.fonts/public-sans/" "fonts/otf/*"
rm -f "$tmp"
