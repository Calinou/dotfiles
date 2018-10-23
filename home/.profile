export GOPATH="$HOME/.go"
export N_PREFIX="$HOME/.local/share"
export PATH="$HOME/.local/bin:$HOME/.basher/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.npm/bin:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin:$HOME/.nimble/bin:$PATH:$HOME/.local/opt/android/platform-tools"
export WINEDEBUG="-all"
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1
export BETTER_EXCEPTIONS=1
export EDITOR="micro"
export VISUAL="micro"
export ANDROID_HOME="$HOME/.local/opt/android"
export ANDROID_NDK_ROOT="$HOME/.local/opt/android/ndk-bundle"
export CODESTATS_API_KEY=$(cat "$HOME/.config/codestats.key")
export RESTIC_REPOSITORY=$(head -n1 "$HOME/.config/restic-default")
export RESTIC_PASSWORD=$(head -n2 "$HOME/.config/restic-default" | tail -n1)
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export POWERSHELL_TELEMETRY_OPTOUT=1

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.zsh/goto/goto.sh"
eval "$(basher init -)"
