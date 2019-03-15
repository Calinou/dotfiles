#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source ~/.profile
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/code-stats-zsh/codestats.plugin.zsh

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
