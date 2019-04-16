#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Pulverize

tmp="$(mktemp)"
curl -fsSL "https://github.com/sciactive/pulverize/archive/master.tar.gz" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/pulverize
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/pulverize/"
rm "$tmp"

cat > "$HOME/.local/bin/pulverize" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/pulverize/"
./pulverize.php "$@"
EOF
chmod +x "$HOME/.local/bin/pulverize"
