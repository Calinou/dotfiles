#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Nuncabola

VERSION="0.193"

tmp="$(mktemp)"
curl -fsSL "http://uppgarn.com/nuncabola/nuncabola-$VERSION.zip" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/nuncabola \
    "$HOME/.local/share/applications/nuncabola.desktop"
unzip "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/Nuncabola/" "$HOME/.local/opt/nuncabola/"

cat > "$HOME/.local/bin/nuncabola" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/nuncabola/"
java -jar nuncabola.jar "$@"
EOF
chmod +x "$HOME/.local/bin/nuncabola"

cat > "$HOME/.local/share/applications/nuncabola.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Nuncabola
GenericName=Rolling ball game
Comment=3D rolling ball game
Exec=$HOME/.local/bin/nuncabola
Icon=nuncabola
Categories=Game;
EOF
