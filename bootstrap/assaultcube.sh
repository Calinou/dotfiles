#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install AssaultCube

VERSION="1.3.0.1"

tmp="$(mktemp)"
curl -fsSL "https://github.com/assaultcube/AC/releases/download/v$VERSION/AssaultCube_v${VERSION}_LockdownEdition_RC2.tar.bz2" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/assaultcube \
    "$HOME/.local/share/applications/assaultcube.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/assaultcube/"
rm "$tmp"

cat > "$HOME/.local/bin/assaultcube" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/assaultcube/"
./assaultcube.sh "$@"
EOF
chmod +x "$HOME/.local/bin/assaultcube"

cat > "$HOME/.local/share/applications/assaultcube.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=AssaultCube
GenericName=First-person shooter
Comment=Semi-realistic first-person shooter based on the Cube engine
Exec=$HOME/.local/bin/assaultcube
Icon=assaultcube
Categories=Game;
EOF
