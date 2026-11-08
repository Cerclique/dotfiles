# dotfiles

Personal dotfiles for Arch Linux + Hyprland (Lua config), managed with [GNU stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package that mirrors `$HOME`; `system/` holds files outside `$HOME` and is never stowed.

## Install

```sh
git clone <repo> ~/dotfiles && cd ~/dotfiles
./install.sh
```

`install.sh` is idempotent. It installs `packages.txt` (pacman, plus yay for `aur:` entries), clones oh-my-zsh,
stows the packages listed in `stow-packages`, links `system/sddm/sddm.conf` to `/etc/sddm.conf` (sudo),
enables the user services and recreates the GTK 4 theme links.

To stow a single package: `stow -v <package>`. Dry run: `stow -n -v <package>`.

## Theme

`theme/` is the single source of the Catppuccin Mocha palette and font (see `theme/.config/theme/README.md`).
