#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Red Eclipse

tmp="$(mktemp)"
curl -fsSL "https://github.com/red-eclipse/base/releases/download/v1.6.0/redeclipse_1.6.0_nix.tar.bz2" \
    -o "$tmp"
rm -rf \
    "$HOME/.local/opt/redeclipse/" \
    "$HOME/.local/bin/redeclipse" \
    "$HOME/.local/share/applications/redeclipse.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/redeclipse/"
rm "$tmp"

# Clean up unnecessary files
rm -rf "$HOME/.local/opt/redeclipse"/{docs,src,README.html}

cat > "$HOME/.local/bin/redeclipse" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/redeclipse/"
./redeclipse.sh "$@"
EOF
chmod +x "$HOME/.local/bin/redeclipse"

cat > "$HOME/.local/share/applications/redeclipse.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Red Eclipse
GenericName=First-person shooter
Comment=Arena first-person shooter with parkour elements
Exec=$HOME/.local/bin/redeclipse
Icon=redeclipse
Categories=Game;
EOF