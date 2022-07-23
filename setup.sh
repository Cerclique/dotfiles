#!/bin/sh

# List of mandatory package
packages=(
# I3"
	"i3" 
	"i3-gaps" 
	"i3-lock-fancy-multimonitor" 
# Terminal
	"kitty"
# Image viewer
	"feh"
# Notification
	"dunst"
# Shadow and border
	"picom"
# Application launcher
	"rofi"
# Status bar
	"polybar"
# Shell
	"zsh"
	"oh-my-zsh-git"
# Text editor
	"emacs"
# Media player
	"mpv"
# Grep alternative
	"ripgrep"
# Fuzzy find
	"fzf"
# Login screen
	"lightdm-mini-greeter"
# Monitor manager
	"mons"
# Process manager
	"htop"
# Bluetooth
	"bluez"
	"bluez-utils"
# Spotify
	"spotifyd"
	"spt"
# Password manager
	"pass")

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
