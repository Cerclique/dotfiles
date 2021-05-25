export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dissoni"

DISABLE_UPDATE_PROMPT="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias t="tree -L 1"
alias emacs="emacs ."
alias git=hub
alias m="make"
alias mc="make clean"
alias l="exa -bghl"


export PATH="$PATH:/home/kiwi/.local/bin"
