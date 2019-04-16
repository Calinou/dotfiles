#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install GanttProject

VERSION="2.8.10-r2364"

tmp="$(mktemp)"
curl -fsSL "https://dl.ganttproject.biz/ganttproject-${VERSION%-*}/ganttproject-$VERSION.zip" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/ganttproject
unzip "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/ganttproject-$VERSION/" "$HOME/.local/opt/ganttproject/"

ln -s "$HOME/.local/opt/ganttproject/ganttproject" "$HOME/.local/bin/ganttproject"
