#!/usr/bin/env bash

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

# Install diff-so-fancy

curl -Lo \
    "$HOME/.local/bin/diff-so-fancy" \
    "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
chmod +x "$HOME/.local/bin/diff-so-fancy"

# Install packages

cargo install \
    bat cargo-bloat cargo-update clippy cross dssim exa fd-find hyperfine \
    oxipng parallel racer ripgrep rls rustfmt svgcleaner tealdeer tokei \
    watchexec &

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

pip3 install --user --upgrade \
    black codespell gitup httpie meson pip pipenv pylint setuptools sphinx \
    speedtest-cli youtube-dl &

yarn global add \
    clean-css-cli colour-cli eslint gulp-cli lighthouse markdownlint-cli \
    n npm-check-updates npms-cli npx ntl prettier randomatic-cli serve \
    stylelint tslint typescript uncss wappalyzer

echo -e "\n$COLOR_GRAY"
printf '—%.0s' {1..80}
echo -e "\n ${COLOR_GREEN}Done bootstrapping.${COLOR_GRAY}"
printf '—%.0s' {1..80}
echo -e "$COLOR_RESET"
