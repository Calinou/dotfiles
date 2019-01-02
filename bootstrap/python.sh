#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install pyenv and Python if not already present

if ! command -v pyenv > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer" \
      -o "$tmp"
  bash "$tmp"
  rm "$tmp"
  export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"

  pyenv install 3.7.2
  pyenv install 2.7.15
  pyenv global 2.7.15 3.7.2
fi

# Install packages

pip3 install --upgrade \
    black codespell gitup httpie meson pip pipenv pre-commit pylint remarshal \
    setuptools speedtest-cli sphinx sphinx_rtd_theme youtube-dl
