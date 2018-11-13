#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Julia

if ! command -v julia > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.2-linux-x86_64.tar.gz" \
      -o "$tmp"
  tar xf "$tmp" -C "$HOME/.local/opt/"
  rm "$tmp"
  mv "$HOME/.local/opt"/julia* "$HOME/.local/opt/julia"

  ln -s "$HOME/.local/opt/julia/bin/julia" "$HOME/.local/bin/julia"
fi
