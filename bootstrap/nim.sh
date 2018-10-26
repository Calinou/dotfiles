#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install choosenim and Nim if not already present

if ! command -v choosenim > /dev/null 2>&1; then
  export CHOOSENIM_NO_ANALYTICS=1
  export CHOOSENIM_CHOOSE_VERSION="stable"
  tmp="$(mktemp)"
  curl -fsS "https://nim-lang.org/choosenim/init.sh" -o "$tmp"
  sh "$tmp" -y
  rm "$tmp"
  export PATH="$HOME/.nimble/bin:$PATH"
fi

# Install packages

nimble install -y clr nimcr https://github.com/Calinou/gits
