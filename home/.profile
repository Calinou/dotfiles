export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$HOME/.rbenv/bin:$HOME/.npm/bin:$HOME/.cargo/bin:$GOPATH/bin:$HOME/Documents/Git/nim-lang/nim/bin:$HOME/.nimble/bin:$PATH"
export WINEDEBUG="-all"
export MICRO_TRUECOLOR=1
export EDITOR="micro"
export VISUAL="micro"
export ANDROID_HOME="$HOME/.local/opt/android"
export ANDROID_NDK_ROOT="$HOME/.local/opt/android/ndk-bundle"

eval "$(rbenv init -)"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
