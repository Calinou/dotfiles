#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install pyenv and Python if not already present

PYTHON3_VERSION="3.7.4"
PYTHON2_VERSION="2.7.16"

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

# Install Poetry

curl -sSL "https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py" | python

# Install packages

pip3 install --upgrade \
    black \
    buku \
    codespell \
    flake8 \
    gitup \
    httpie \
    meson \
    mitmproxy \
    mypy \
    pip \
    pipenv \
    pre-commit \
    pylint \
    py-spy \
    remarshal \
    rope \
    setuptools \
    speedtest-cli \
    sphinx \
    sphinx_rtd_theme \
    weasyprint \
    youtube-dl
