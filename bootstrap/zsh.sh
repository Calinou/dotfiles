#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Basher

git clone --depth=1 \
    "https://github.com/basherpm/basher.git" \
    "$HOME/.basher" || true

# Install Prezto

git clone --depth=1 --recursive \
    "https://github.com/sorin-ionescu/prezto.git" \
    "${ZDOTDIR:-$HOME}/.zprezto" || true

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)" || true
done

# Install zsh-autosuggestions

git clone --depth=1 \
    "https://github.com/zsh-users/zsh-autosuggestions.git" \
    "$HOME/.zsh/zsh-autosuggestions" || true

# Install Code::Stats zsh plugin

git clone --depth=1 \
    "https://gitlab.com/code-stats/code-stats-zsh.git" \
    "$HOME/.zsh/code-stats-zsh" || true

# Install goto

git clone --depth=1 \
    "https://github.com/iridakos/goto.git" \
    "$HOME/.zsh/goto" || true

# Install diff-so-fancy

if ! command -v diff-so-fancy > /dev/null 2>&1; then
  curl -fsSL
      "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy" \
      -o "$HOME/.local/bin/diff-so-fancy"
  chmod +x "$HOME/.local/bin/diff-so-fancy"
fi

# Set default shell

chsh -s /bin/zsh

