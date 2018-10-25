#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Google Fonts

git clone --depth 1 \
		"https://github.com/google/fonts.git" \
		"$HOME/.fonts/google-fonts/" || true

# Install Inter UI

tmp="$(mktemp)"
curl -fsSLo "$tmp" "https://github.com/rsms/inter/releases/download/v3.0/Inter-UI-3.0.zip"
unzip -o "$tmp" "Inter UI (TTF hinted)/*" -d "$HOME/.fonts/"
rm "$tmp"
