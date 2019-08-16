#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Android SDK

SDK_VERSION="4333796"

tmp="$(mktemp)"
curl -fsSL "https://dl.google.com/android/repository/sdk-tools-linux-$SDK_VERSION.zip" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/android/"
unzip "$tmp" -d "$HOME/.local/opt/android/"
rm "$tmp"

# Install Android NDK

NDK_VERSION="r20"

tmp="$(mktemp)"
curl -fsSL "https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/android/ndk-bundle/"
unzip "$tmp" -d "$HOME/.local/opt/android/"
rm "$tmp"
mv "$HOME/.local/opt/android/android-ndk-$NDK_VERSION/" "$HOME/.local/opt/android/ndk-bundle/"
