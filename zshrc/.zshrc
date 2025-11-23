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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.volta/bin:$PATH
