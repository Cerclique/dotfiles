export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="dissoni"

DISABLE_UPDATE_PROMPT="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias git=hub
alias l="exa -bghl"
