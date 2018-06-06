export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$HOME/.rbenv/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin:$HOME/.nimble/bin:$HOME/Documents/Git/matejak/argbash/bin:$PATH"
export WINEDEBUG="-all"
export MICRO_TRUECOLOR=1
export BETTER_EXCEPTIONS=1
export EDITOR="micro"
export VISUAL="micro"
export ANDROID_HOME="$HOME/.local/opt/android"
export ANDROID_NDK_ROOT="$HOME/.local/opt/android/ndk-bundle"
export CODESTATS_API_KEY=$(cat "$HOME/.codestats.key")
export DOTNET_CLI_TELEMETRY_OPTOUT=1

eval "$(rbenv init -)"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
