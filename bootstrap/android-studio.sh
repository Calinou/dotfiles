#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Android Studio

tmp="$(mktemp)"
curl -fsSL "https://dl.google.com/dl/android/studio/ide-zips/3.5.0.21/android-studio-ide-191.5791312-linux.tar.gz" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/android-studio \
    "$HOME/.local/share/applications/android-studio.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/android-studio/"
rm "$tmp"

cat > "$HOME/.local/bin/android-studio" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/android-studio/bin/"
./studio.sh "$@"
EOF
chmod +x "$HOME/.local/bin/android-studio"

cat > "$HOME/.local/share/applications/android-studio.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Android Studio
GenericName=Integrated development environment
Comment=IDE for developing Android applications
Exec=$HOME/.local/bin/android-studio
Icon=android-studio
Categories=Development;IDE;
EOF
