#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Yarn if not already present

if ! command -v yarn > /dev/null 2>&1; then
  tmp="$(mktemp)"
  curl -fsSL "https://yarnpkg.com/install.sh" -o "$tmp"
  bash "$tmp"
  rm "$tmp"
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# Install packages

yarn global add \
    clean-css-cli eslint gulp-cli lighthouse markdownlint-cli \
    npm-check-updates npms-cli npx ntl prettier randomatic-cli serve \
    site-scan stylelint tslint typescript uncss wappalyzer
