#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install pyenv and Python if not already present

if ! command -v pyenv > /dev/null 2>&1; then
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
  export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"

  pyenv install 3.7.1
  pyenv install 2.7.15
  pyenv global 2.7.15 3.7.1
fi

# Install packages

pip3 install --upgrade \
    black codespell gitup httpie meson pip pipenv pre-commit pylint remarshal \
    setuptools speedtest-cli sphinx sphinx_rtd_theme youtube-dl