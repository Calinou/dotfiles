#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install OpenArena

tmp="$(mktemp)"
curl -fsSL "http://download.tuxfamily.org/openarena/rel/088/openarena-0.8.8.zip" \
    -o "$tmp"
rm -rf \
    "$HOME"/.local/{bin,opt}/openarena \
    "$HOME/.local/share/applications/openarena.desktop"
unzip "$tmp" -d "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt/openarena-0.8.8/" "$HOME/.local/opt/openarena/"

# Clean up unnecessary files
rm -rf "$HOME/.local/opt/openarena"/{__MACOSX,*.app,*.dll,*.exe,*.i386}

# Create a launcher script
cat > "$HOME/.local/bin/openarena" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/openarena/"
./openarena.x86_64 "$@"
EOF
chmod +x "$HOME/.local/bin/openarena"

# Create a desktop entry
cat > "$HOME/.local/share/applications/openarena.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=OpenArena
GenericName=First-person shooter
Comment=Fast-paced first-person shooter based on ioquake3
Exec=$HOME/.local/bin/openarena
Icon=openarena
Categories=Game;
EOF
