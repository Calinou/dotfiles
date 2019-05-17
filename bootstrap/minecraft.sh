#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install the Minecraft launcher

tmp="$(mktemp)"
curl -fsSL "https://launcher.mojang.com/download/Minecraft.tar.gz" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/minecraft \
    "$HOME/.local/share/applications/minecraft.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/minecraft/"
rm "$tmp"

cat > "$HOME/.local/bin/minecraft" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/minecraft/"
./minecraft-launcher "$@"
EOF
chmod +x "$HOME/.local/bin/minecraft"

cat > "$HOME/.local/share/applications/minecraft.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Minecraft
GenericName=Sandbox game
Comment=Infinite world sandbox game
Exec=$HOME/.local/bin/minecraft
Icon=minecraft
Categories=Game;
EOF
