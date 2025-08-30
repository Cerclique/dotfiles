# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kiwi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dissoni"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# aliases
alias l="eza -bghla --total-size --no-time --icons=always"

# temporary fix for Zed and Nvidia 580 driver
zed() {
  WAYLAND_DISPLAY='' zeditor "$@"
}
