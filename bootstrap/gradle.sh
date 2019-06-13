#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Gradle

VERSION="5.4.1"

tmp="$(mktemp)"
curl -fsSL "https://downloads.gradle.org/distributions/gradle-$VERSION-bin.zip" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/gradle
unzip "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/gradle-$VERSION/" "$HOME/.local/opt/gradle/"

ln -s "$HOME/.local/opt/gradle/bin/gradle" "$HOME/.local/bin/gradle"
