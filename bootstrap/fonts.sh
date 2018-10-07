#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Google Fonts
git clone "https://github.com/google/fonts.git" "$HOME/.fonts/google-fonts/"

# Inter UI
tmp="$(mktemp)"
curl -Lo "$tmp" "https://github.com/rsms/inter/releases/download/v2.5/Inter-UI-2.5.zip"
unzip "$tmp" "Inter UI (TTF hinted)/*" -d "$HOME/.fonts/"
rm "$tmp"
