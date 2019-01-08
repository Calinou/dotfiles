#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install SteamCMD

tmp="$(mktemp)"
curl -fsSL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
    -o "$tmp"
rm -rf \
    "$HOME/.local/opt/steamcmd/" \
    "$HOME/.local/bin/steamcmd"
tar xf "$tmp" --one-top-level="$HOME/.local/opt/steamcmd/"
rm "$tmp"

cat > "$HOME/.local/bin/steamcmd" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/steamcmd/"
./steamcmd.sh "$@"
EOF
chmod +x "$HOME/.local/bin/steamcmd"
