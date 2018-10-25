#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install rbenv and Ruby if not already present

if ! command -v rbenv > /dev/null 2>&1; then  
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

  rbenv install 2.5.1
  rbenv global 2.5.1

  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
fi

# Install packages

gem install bundler travis
