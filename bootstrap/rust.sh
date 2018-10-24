#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install rustup and stable Rust if not already present

if ! command -v rustup > /dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install packages

cargo install \
    bat cargo-bloat cargo-update clippy cross dssim exa fd-find hyperfine \
    oxipng parallel racer ripgrep rls rustfmt svgcleaner tealdeer tokei \
    watchexec
