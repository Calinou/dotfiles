#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install packages

go get -u \
    github.com/golang/dep/cmd/dep \
    github.com/asciimoo/wuzz \
    github.com/bcicen/xiny \
    github.com/Calinou/fov \
    github.com/Calinou/ipinfo \
    github.com/FiloSottile/mkcert \
    github.com/genuinetools/certok \
    github.com/genuinetools/weather \
    github.com/magefile/mage \
    github.com/mitchellh/gox \
    github.com/mgechev/revive \
    github.com/rakyll/hey \
    github.com/raviqqe/muffet \
    github.com/tdewolff/minify/cmd/minify \
    github.com/xo/usql &
