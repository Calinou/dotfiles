#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Android SDK

tmp="$(mktemp)"
curl -fsSL "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/android/"
unzip "$tmp" -d "$HOME/.local/opt/android/"
rm "$tmp"

# Install Android NDK

tmp="$(mktemp)"
curl -fsSL "https://dl.google.com/android/repository/android-ndk-r18b-linux-x86_64.zip" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/android/ndk-bundle/"
unzip "$tmp" -d "$HOME/.local/opt/android/"
rm "$tmp"
mv "$HOME/.local/opt/android/android-ndk-r18b/" "$HOME/.local/opt/android/ndk-bundle/"
