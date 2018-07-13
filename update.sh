#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

COLOR_GRAY="\e[1;30m"
COLOR_GREEN="\e[1;32m"
COLOR_RESET="\e[0m"

cargo install-update -a
yarn global upgrade

echo -e "\n$COLOR_GRAY"
printf '—%.0s' {1..80}
echo -e "\n ${COLOR_GREEN}Done updating.${COLOR_GRAY}"
printf '—%.0s' {1..80}
echo -e "$COLOR_RESET"
