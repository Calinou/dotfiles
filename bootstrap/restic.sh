#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install restic

tmp="$(mktemp)"
curl -fsSL "https://github.com/restic/restic/releases/download/v0.9.4/restic_0.9.4_linux_amd64.bz2" \
    -o "$tmp"
bunzip2 "$tmp"
chmod +x "$tmp.out"
sudo mv -f "$tmp.out" "/usr/local/bin/restic"
