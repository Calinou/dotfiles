#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install pyenv and Python if not already present

PYTHON_VERSION="3.9.0"

if ! command -v pyenv > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer" \
      -o "$tmp"
  bash "$tmp"
  rm "$tmp"
  export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"

  CONFIGURE_OPTS="--enable-optimizations" pyenv install "$PYTHON_VERSION"
  pyenv global "$PYTHON_VERSION"
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
    guardonce \
    httpie \
    meson \
    mypy \
    pip \
    pipenv \
    pre-commit \
    pylint \
    py-spy \
    remarshal \
    rope \
    scons \
    setuptools \
    speedtest-cli \
    sphinx \
    sphinx_rtd_theme \
    weasyprint \
    youtube-dl
