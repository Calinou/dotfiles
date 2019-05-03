#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Urban Terror

tmp="$(mktemp)"
curl -fsSL "http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror434_full.zip" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/urbanterror \
    "$HOME/.local/share/applications/urbanterror.desktop"
unzip -o "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/UrbanTerror43/" "$HOME/.local/opt/urbanterror/"

cat > "$HOME/.local/bin/urbanterror" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/urbanterror/"
./Quake3-UrT.x86_64 "$@"
EOF
chmod +x "$HOME/.local/bin/urbanterror"

cat > "$HOME/.local/share/applications/urbanterror.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Urban Terror
GenericName=First-person shooter
Comment=Semi-realistic first-person shooter based on ioquake3
Exec=$HOME/.local/bin/urbanterror
Icon=urbanterror
Categories=Game;
EOF
