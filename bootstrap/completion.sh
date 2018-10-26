#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

mkdir -p "$HOME/.zsh/completion/"
curl -fsSL "https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/zsh/_docker-compose" \
    -o "$HOME/.zsh/completion/_docker-compose"
