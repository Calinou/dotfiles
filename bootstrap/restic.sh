#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install restic

VERSION="0.9.5"

tmp="$(mktemp)"
curl -fsSL "https://github.com/restic/restic/releases/download/v$VERSION/restic_${VERSION}_linux_amd64.bz2" \
    -o "$tmp"
bunzip2 "$tmp"
chmod +x "$tmp.out"
sudo mv -f "$tmp.out" "/usr/local/bin/restic"
