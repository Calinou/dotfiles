#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install pyenv and Python if not already present

PYTHON3_VERSION="3.7.3"
PYTHON2_VERSION="2.7.15"

if ! command -v pyenv > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer" \
      -o "$tmp"
  bash "$tmp"
  rm "$tmp"
  export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"

  pyenv install "$PYTHON3_VERSION"
  pyenv install "$PYTHON2_VERSION"
  pyenv global "$PYTHON2_VERSION" "$PYTHON3_VERSION"
fi

# Install packages

pip3 install --upgrade \
    black buku codespell flake8 gitup httpie meson mypy pip pipenv pre-commit \
    pylint remarshal setuptools speedtest-cli sphinx sphinx_rtd_theme youtube-dl
