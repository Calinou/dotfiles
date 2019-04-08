#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Warsow

VERSION="2.1.2"

tmp="$(mktemp)"
curl -fsSL "http://sebastian.network/warsow/warsow-$VERSION.tar.gz" \
    -o "$tmp"
rm -rf \
    "$HOME/.local/opt/warsow/" \
    "$HOME/.local/bin/warsow" \
    "$HOME/.local/share/applications/warsow.desktop"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/warsow/"
rm "$tmp"

# Clean up unnecessary files
rm -rf "$HOME/.local/opt/warsow"/{docs,libs/*.dll,libs/*.dylib,libs/*_i386.so,*.i386,*.exe,warsow,wsw_server,wswtv_server}

cat > "$HOME/.local/bin/warsow" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/warsow/"
./warsow.x86_64 "$@"
EOF
chmod +x "$HOME/.local/bin/warsow"

cat > "$HOME/.local/share/applications/warsow.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Warsow
GenericName=First-person shooter
Comment=Fast-paced first-person shooter set in a futuristic cartoonish world
Exec=$HOME/.local/bin/warsow
Icon=warsow
Categories=Game;
EOF
