#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install rbenv and Ruby if not already present

RUBY_VERSION="2.7.0"

if ! command -v rbenv > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer" \
      -o "$tmp"
  bash "$tmp" || true
  rm "$tmp"
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

  rbenv install "$RUBY_VERSION"
  rbenv global "$RUBY_VERSION"
fi

# Install packages

gem install bundler solargraph travis
