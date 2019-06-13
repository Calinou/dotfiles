#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Shotcut

tmp="$(mktemp)"
curl -fsSL "https://github.com/mltframework/shotcut/releases/download/v19.06.04/shotcut-linux-x86_64-190604.txz" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/shotcut \
    "$HOME/.local/share/applications/shortcut.desktop"
mkdir "$HOME/.local/opt/shotcut/"
tar xf "$tmp" --strip-components=2 -C "$HOME/.local/opt/shotcut/"
rm "$tmp"

cat > "$HOME/.local/bin/shotcut" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/shotcut/"
./shotcut "$@"
EOF
chmod +x "$HOME/.local/bin/shotcut"

cat > "$HOME/.local/share/applications/shotcut.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Shotcut
GenericName=Video editor
Comment=Video editor
Exec=$HOME/.local/bin/shotcut
Icon=shotcut
Categories=AudioVideo;Video;AudioVideoEditing;
Keywords=video;audio;editing;suite;mlt;4k;video4linux;blackmagic;decklink;
EOF
