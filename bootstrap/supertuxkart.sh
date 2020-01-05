#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install SuperTuxKart

tmp="$(mktemp)"
curl -fsSL "https://iweb.dl.sourceforge.net/project/supertuxkart/SuperTuxKart/1.1/SuperTuxKart-1.1-linux.tar.xz" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/supertuxkart \
    "$HOME/.local/share/applications/supertuxkart.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/supertuxkart/"
rm "$tmp"

cat > "$HOME/.local/bin/supertuxkart" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/supertuxkart/"
./run_game.sh "$@"
EOF
chmod +x "$HOME/.local/bin/supertuxkart"

cat > "$HOME/.local/share/applications/supertuxkart.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=SuperTuxKart
GenericName=Racing game
Comment=Arcade racing game
Exec=$HOME/.local/bin/supertuxkart
Icon=supertuxkart
Categories=Game;
EOF
