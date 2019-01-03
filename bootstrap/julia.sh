#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Julia

tmp="$(mktemp)"
curl -fsSL "https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.3-linux-x86_64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME/.local/opt/julia/" "$HOME/.local/bin/julia"
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt"/julia* "$HOME/.local/opt/julia"

ln -s "$HOME/.local/opt/julia/bin/julia" "$HOME/.local/bin/julia"
