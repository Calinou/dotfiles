#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install gimme and Go if not already present

if ! command -v gimme > /dev/null 2>&1; then
  curl -fsSL "https://raw.githubusercontent.com/travis-ci/gimme/master/gimme" \
      -o "$HOME/.local/bin/gimme"
  chmod +x "$HOME/.local/bin/gimme"

  gimme 1.11.5
fi

# Install packages

go get -u \
    github.com/golang/dep/cmd/dep \
    github.com/asciimoo/wuzz \
    github.com/bcicen/xiny \
    github.com/Calinou/fov \
    github.com/Calinou/ipinfo \
    github.com/eliukblau/pixterm \
    github.com/FiloSottile/mkcert \
    github.com/genuinetools/certok \
    github.com/genuinetools/weather \
    github.com/magefile/mage \
    github.com/mitchellh/gox \
    github.com/mgechev/revive \
    github.com/rakyll/hey \
    github.com/raviqqe/muffet \
    github.com/tdewolff/minify/cmd/minify \
    github.com/xo/usql
