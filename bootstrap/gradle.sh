#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Gradle

tmp="$(mktemp)"
curl -fsSL "https://services.gradle.org/distributions/gradle-5.0-bin.zip" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/gradle/"
unzip "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/gradle-5.0/" "$HOME/.local/opt/gradle/"

ln -s "$HOME/.local/opt/gradle/bin/gradle" "$HOME/.local/bin/gradle"
