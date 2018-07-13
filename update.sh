#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

COLOR_GRAY="\e[1;30m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

# Update zsh plugins and utilities

for repo in $HOME/.zsh/*; do
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

echo -e "\n$COLOR_GRAY"
printf '—%.0s' {1..80}
echo -e "\n ${COLOR_GREEN}Done updating.${COLOR_GRAY}"
printf '—%.0s' {1..80}
echo -e "$COLOR_RESET"
