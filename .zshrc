# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dracula"
DRACULA_ARROW_ICON="⠷ "

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

export TERM="alacritty"
export VISUAL="nvim"
export EDITOR="nvim"

alias logout="pkill -KILL -u bachitterch"
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'

# bun completions
[ -s "/home/bachitterch/.bun/_bun" ] && source "/home/bachitterch/.bun/_bun"

# Bun
export BUN_INSTALL="/home/bachitterch/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
