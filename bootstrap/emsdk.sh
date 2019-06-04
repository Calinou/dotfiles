#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Emscripten SDK

git clone "https://github.com/emscripten-core/emsdk.git" "$HOME/.local/opt/emsdk/"
cd "$HOME/.local/opt/emsdk/"
./emsdk install latest
./emsdk activate latest
