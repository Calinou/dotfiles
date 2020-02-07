#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install tmux theme pack

git clone https://github.com/jimeh/tmux-themepack.git "$HOME/.tmux-themepack"
