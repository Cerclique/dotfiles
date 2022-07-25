#!/bin/sh

# List of mandatory package
packages=(
# Mesa
	"mesa"
	"mesa-tools"
# Xorg
	"xorg-server"
	"xorg-xinit"
	"xorg-xephyr"
# Lightdm
	"lightdm"
# Man
	"man"
# I3
	"i3" 
	"i3-gaps" 
	"i3lock-fancy-multimonitor" 
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
# ls replacement
	"exa"
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
	"pass"
# Brightness controller
	"brightnessctl"
# Inotify
	"inotify-tools"
# Browser
	"brave-bin")

# Install each package
for str in ${packages[@]}; do
  yay -Sy $str
done

# Copy .zshrc file
cp -f "./.zshrc" /home/$USER/.zshrc

# Copy lightdm
cp -f -r "./lightdm" /etc/

# Copy oh-my-zsh theme
cp -f -r "./.oh-my-zsh" /usr/share/

# Copy .config
cp -f -r "./.config" /home/$USER/

# Set ZSH as default shell
chsh -s /bin/zsh
