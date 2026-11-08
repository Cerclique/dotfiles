#!/usr/bin/env bash
# Idempotent bootstrap for an Arch Linux machine. Run from anywhere: ./install.sh
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES"

strip() { grep -v -e '^\s*#' -e '^\s*$' "$1"; }

# 1. Packages
mapfile -t official < <(strip packages.txt | grep -v '^aur:')
mapfile -t aur < <(strip packages.txt | grep '^aur:' | sed 's/^aur://')
sudo pacman -S --needed --noconfirm "${official[@]}"
if ((${#aur[@]})); then
  command -v yay >/dev/null || { echo "yay is required for AUR packages: ${aur[*]}" >&2; exit 1; }
  yay -S --needed --noconfirm "${aur[@]}"
fi

# 2. oh-my-zsh (custom dir lives in ~/.config/zsh/custom, stowed below)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi
mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/zsh"

# 3. Home packages
mapfile -t pkgs < <(strip stow-packages)
stow --restow --target="$HOME" "${pkgs[@]}"

# 4. SDDM config (needs root)
sudo ln -sfn "$DOTFILES/system/sddm/sddm.conf" /etc/sddm.conf

# 5. User services
systemctl --user enable ssh-agent.socket
if systemctl --user cat orbit.service >/dev/null 2>&1; then
  systemctl --user enable orbit.service
else
  echo "orbit.service not found, skipping" >&2
fi

# 6. GTK 4 theme links
theme="/usr/share/themes/catppuccin-mocha-red-standard+default/gtk-4.0"
mkdir -p "$HOME/.config/gtk-4.0"
for f in assets gtk.css gtk-dark.css; do
  ln -sfn "$theme/$f" "$HOME/.config/gtk-4.0/$f"
done
