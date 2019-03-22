#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install rustup and stable Rust if not already present

if ! command -v rustup > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsS "https://sh.rustup.rs" -o "$tmp"
  sh "$tmp"
  rm "$tmp"
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install Rust components

rustup component add \
    clippy \
    rustfmt

# Install packages

cargo install \
    bat \
    cargo-audit \
    cargo-bloat \
    cargo-edit \
    cargo-fix \
    cargo-license \
    cargo-outdated \
    cargo-update \
    cargo-watch \
    cross \
    dssim \
    exa \
    fd-find \
    gifski \
    hyperfine \
    lagraph \
    oxipng \
    parallel \
    racer \
    ripgrep \
    rls \
    svgcleaner \
    tealdeer \
    tokei \
    watchexec
