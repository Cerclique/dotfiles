# dotfiles

[![CI](https://github.com/Cerclique/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/Cerclique/dotfiles/actions/workflows/ci.yml)

Personal dotfiles for Arch Linux + Hyprland (Lua config), managed with [GNU stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package that mirrors `$HOME`; `system/` holds files outside `$HOME` and is never stowed.

## Components

| Role | Choice |
| --- | --- |
| Window manager | Hyprland |
| Bar | Waybar |
| Launcher | wofi |
| Terminal | kitty |
| Shell | zsh + oh-my-zsh |
| File manager | yazi (terminal), Thunar (`SUPER + E`) |
| Editor | Zed |
| Git UI | gitui |
| System monitor | htop |
| Login manager | SDDM |
| Theme | Catppuccin Mocha + JetBrainsMono Nerd Font |

## Install

> [!WARNING]
> `install.sh` uses `sudo`, writes `/etc/sddm.conf` and is tailored to one machine.
> Read it before running it.

```sh
git clone https://github.com/Cerclique/dotfiles ~/dotfiles && cd ~/dotfiles
./install.sh
```

`install.sh` is idempotent. It installs `packages.txt` (pacman, plus yay for `aur:` entries), clones oh-my-zsh,
stows the packages listed in `stow-packages`, links `system/sddm/sddm.conf` to `/etc/sddm.conf` (sudo),
enables the user services and recreates the GTK 4 theme links.

To stow a single package: `stow -v <package>`. Dry run: `stow -n -v <package>`.

## Keybindings

Main modifier is `SUPER` (defined in `hypr/.config/hypr/binds.lua`).

| Keys | Action |
| --- | --- |
| `SUPER + Return` | Open terminal (kitty) |
| `SUPER + Space` | Application launcher (wofi) |
| `SUPER + E` | File manager (Thunar) |
| `SUPER + C` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + L` | Lock screen (hyprlock) |
| `SUPER + SHIFT + S` | Region screenshot (hyprshot) |
| `SUPER + arrows` | Move focus |
| `SUPER + SHIFT + arrows` | Move window |
| `SUPER + 1…0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1…0` | Move window to workspace 1–10 |

## Layout

- Top-level directories listed in `stow-packages` are stow packages: their contents are symlinked into `$HOME`.
- `system/` holds files outside `$HOME` (e.g. SDDM config) and is never stowed.
- `theme/` is the single source of the Catppuccin Mocha palette and font
  (see `theme/.config/theme/README.md`).
