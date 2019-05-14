#!/bin/bash

export ANDROID_HOME="$HOME/.local/opt/android"
export ANDROID_NDK_ROOT="$ANDROID_HOME/ndk-bundle"
export GOPATH="$HOME/.go"
export GOROOT="$HOME/.gimme/versions/go1.12.5.linux.amd64"
export N_PREFIX="$HOME/.local/share"
export PATH="$HOME/.local/bin:$HOME/.basher/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.yarn/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.poetry/bin:$HOME/.config/composer/vendor/bin:$HOME/.nimble/bin:$HOME/.luarocks/bin:/home/linuxbrew/.linuxbrew/bin:$PATH:$ANDROID_HOME/platform-tools"

export EDITOR="micro"
export VISUAL="micro"
export WINEDEBUG="-all"
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export BETTER_EXCEPTIONS=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1
export PHAN_DISABLE_XDEBUG_WARN=1
export FZF_DEFAULT_COMMAND="fd"
export FZF_DEFAULT_OPTS="--exact"

export CODESTATS_API_KEY
CODESTATS_API_KEY=$(cat "$HOME/.config/codestats.key")
export RESTIC_REPOSITORY
RESTIC_REPOSITORY=$(head -n1 "$HOME/.config/restic-default")
export RESTIC_PASSWORD
RESTIC_PASSWORD=$(head -n2 "$HOME/.config/restic-default" | tail -n1)

# Required for docker-compose
export UID

alias make="make -j $(nproc)"
alias ls="exa"
alias la="exa -a"
alias git="hub"
alias pwsh="pwsh -NoLogo"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.zsh/goto/goto.sh"
eval "$(basher init -)"

transfer() {
  if [ "$#" -eq 0 ]; then
    echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
    return 1
  fi

  tmpfile="$(mktemp -t transferXXX)"

  if tty -s; then
    basefile="$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')"
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> "$tmpfile"
  else
    curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> "$tmpfile"
  fi

  cat "$tmpfile"
  rm -f "$tmpfile"
}
