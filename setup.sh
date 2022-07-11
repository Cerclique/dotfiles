#!/bin/sh

# List of mandatory package
packages=(
	"i3" 
	"i3-gaps" 
	"i3-lock-fancy-multimonitor" 
	"kitty"
	"feh"
	"dunst"
	"picom"
	"rofi"
	"polybar"
	"zsh"
	"oh-my-zsh-git"
	"emacs"
	"mpv"
	"ripgrep"
	"fzf"
	"lightdm-mini-greeter"
	"mons")

# Install each package
for str in ${packages[@]}; do
  yay -Sy $str
done

# Copy .zshrc file
cp -f "./.zshrc" /home/$USER/.zshrc

# Copy lightdm
cp -f -r "./lightdm" /etc/lightdm

# Copy oh-my-zsh theme
cp -f -r "./.oh-my-zsh" /usr/share/oh-my-zsh

# Copy .config
cp -f -r "./.config" /home/$USER/.config

# Set ZSH as default shell
chsh -s /bin/zsh
