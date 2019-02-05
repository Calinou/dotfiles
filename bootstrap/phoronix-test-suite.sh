#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Phoronix Test Suite

tmp="$(mktemp)"
curl -fsSL "https://phoronix-test-suite.com/releases/phoronix-test-suite-8.6.0.tar.gz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/phoronix-test-suite/" "$HOME/.local/bin/phoronix-test-suite"
tar xf "$tmp" --strip-components=1 --one-top-level="$HOME/.local/opt/phoronix-test-suite/"
rm "$tmp"

cat > "$HOME/.local/bin/phoronix-test-suite" << 'EOF'
#!/bin/sh

cd "$HOME/.local/opt/phoronix-test-suite/"
./phoronix-test-suite "$@"
EOF
chmod +x "$HOME/.local/bin/phoronix-test-suite"
