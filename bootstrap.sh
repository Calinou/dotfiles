#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

COLOR_GRAY="\e[1;30m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

# Install Prezto

git clone --recursive \
		"https://github.com/sorin-ionescu/prezto.git" \
		"${ZDOTDIR:-$HOME}/.zprezto" || true

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)" || true
done

git clone \
		"https://github.com/zsh-users/zsh-autosuggestions.git" \
		"$HOME/.zsh/zsh-autosuggestions" || true

git clone \
		"https://gitlab.com/code-stats/code-stats-zsh.git" \
		"$HOME/.zsh/code-stats-zsh" || true

git clone \
		"https://github.com/iridakos/goto.git" \
		"$HOME/.zsh/goto" || true

chsh -s /bin/zsh

# Install packages

cargo install \
		bat cargo-bloat cargo-update clippy cross exa fd-find hyperfine oxipng \
		ripgrep rls rustfmt tealdeer tokei watchexec &

pip3 install --user --upgrade \
		pip setuptools httpie youtube-dl pipenv speedtest-cli &

yarn global add \
		clean-css-cli colour-cli eslint gulp-cli lighthouse n npm-check-updates \
		npms-cli npx ntl prettier randomatic-cli serve stylelint tslint typescript \
		uncss wappalyzer

echo -e "\n$COLOR_GRAY"
printf '—%.0s' {1..80}
echo -e "\n ${COLOR_GREEN}Done bootstrapping.${COLOR_GRAY}"
printf '—%.0s' {1..80}
echo -e "$COLOR_RESET"
