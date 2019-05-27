#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Julia

VERSION="1.1.1"

tmp="$(mktemp)"
curl -fsSL "https://julialang-s3.julialang.org/bin/linux/x64/${VERSION%.*}/julia-$VERSION-linux-x86_64.tar.gz" \
    -o "$tmp"
rm -rf "$HOME"/.local/{bin,opt}/julia
tar xf "$tmp" -C "$HOME/.local/opt/"
rm "$tmp"
mv "$HOME/.local/opt"/julia* "$HOME/.local/opt/julia"

ln -s "$HOME/.local/opt/julia/bin/julia" "$HOME/.local/bin/julia"
