#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Update zsh plugins and utilities

for repo in "$HOME/.zsh/"*; do
	cd "$repo"
	git pull || true
	cd
done

# Update Rust

rustup update

# Update packages

cargo install-update -a &
tldr --update &
yarn global upgrade
