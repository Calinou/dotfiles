#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

COLOR_GRAY="\e[1;30m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

cargo install \
		bat cargo-bloat clippy cross exa fd-find hyperfine oxipng ripgrep rls \
		rustfmt tealdeer tokei &

pip3 install --user --upgrade \
		pip setuptools httpie youtube-dl pipenv speedtest-cli &

yarn global add \
		clean-css-cli colour-cli gulp-cli lighthouse n npm-check-updates npms-cli \
		npx ntl prettier randomatic-cli serve stylelint tslint typescript uncss \
		wappalyzer

echo -e "\n$COLOR_GRAY"
printf '—%.0s' {1..80}
echo -e "\n ${COLOR_GREEN}Done bootstrapping.${COLOR_GRAY}"
printf '—%.0s' {1..80}
echo -e "$COLOR_RESET"
