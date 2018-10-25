#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Yarn if not already present

if ! command -v yarn > /dev/null 2>&1; then
  curl -L https://yarnpkg.com/install.sh | bash
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# Install packages

yarn global add \
    clean-css-cli colour-cli eslint gulp-cli lighthouse markdownlint-cli \
    n npm-check-updates npms-cli npx ntl prettier randomatic-cli serve \
    stylelint tslint typescript uncss wappalyzer