#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Phoronix Test Suite

VERSION="9.6.1"

tmp="$(mktemp)"
curl -fsSL "https://phoronix-test-suite.com/releases/phoronix-test-suite-$VERSION.tar.gz" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/phoronix-test-suite
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/phoronix-test-suite/"
rm "$tmp"

cat > "$HOME/.local/bin/phoronix-test-suite" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/phoronix-test-suite/"
./phoronix-test-suite "$@"
EOF
chmod +x "$HOME/.local/bin/phoronix-test-suite"
