export GOPATH="$HOME/.go"
export GOROOT="$HOME/.gimme/versions/go1.11.5.linux.amd64"
export N_PREFIX="$HOME/.local/share"
export PATH="$HOME/.local/bin:$HOME/.basher/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.yarn/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin:$HOME/.nimble/bin:$HOME/.luarocks/bin:/home/linuxbrew/.linuxbrew/bin:$PATH:$ANDROID_HOME/platform-tools"
export WINEDEBUG="-all"
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export BETTER_EXCEPTIONS=1
export FZF_DEFAULT_COMMAND="fd"
export FZF_DEFAULT_OPTS="--exact"
export EDITOR="micro"
export VISUAL="micro"
export ANDROID_HOME="$HOME/.local/opt/android"
export ANDROID_NDK_ROOT="$ANDROID_HOME/ndk-bundle"
export CODESTATS_API_KEY=$(cat "$HOME/.config/codestats.key")
export RESTIC_REPOSITORY=$(head -n1 "$HOME/.config/restic-default")
export RESTIC_PASSWORD=$(head -n2 "$HOME/.config/restic-default" | tail -n1)
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1

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
