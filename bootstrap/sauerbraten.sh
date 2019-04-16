#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Cube 2: Sauerbraten

tmp="$(mktemp)"
curl -fsSL "https://downloads.sourceforge.net/project/sauerbraten/sauerbraten/2013_01_04/sauerbraten_2013_04_04_collect_edition_linux.tar.bz2" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/sauerbraten \
    "$HOME/.local/share/applications/sauerbraten.desktop"
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"

# Clean up unnecessary files
rm -rf "$HOME/.local/opt/sauerbraten"/{docs,src,README.html}

cat > "$HOME/.local/bin/sauerbraten" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/sauerbraten/"
./sauerbraten_unix "$@"
EOF
chmod +x "$HOME/.local/bin/sauerbraten"

cat > "$HOME/.local/share/applications/sauerbraten.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Cube 2: Sauerbraten
GenericName=First-person shooter
Comment=Fast-paced first-person shooter with cooperative map editing
Exec=$HOME/.local/bin/sauerbraten
Icon=sauerbraten
Categories=Game;
EOF
