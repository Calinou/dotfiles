#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Teeworlds

tmp="$(mktemp)"
curl -fsSL "https://downloads.teeworlds.com/teeworlds-0.7.2-linux_x86_64.tar.gz" \
    -o "$tmp"
rm -rf \
    "$HOME/.local/opt/teeworlds/" \
    "$HOME/.local/bin/teeworlds" \
    "$HOME/.local/share/applications/teeworlds.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/teeworlds/"
rm "$tmp"

cat > "$HOME/.local/bin/teeworlds" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/teeworlds/"
./teeworlds "$@"
EOF
chmod +x "$HOME/.local/bin/teeworlds"

cat > "$HOME/.local/bin/teeworlds_srv" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/teeworlds/"
./teeworlds_srv "$@"
EOF
chmod +x "$HOME/.local/bin/teeworlds_srv"

cat > "$HOME/.local/share/applications/teeworlds.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Teeworlds
Comment=Multiplayer 2D platform-shooter game
Exec=$HOME/.local/bin/teeworlds
Icon=teeworlds
Categories=Game;
EOF
