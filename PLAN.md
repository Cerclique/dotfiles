# Dotfiles improvement plan

Taken from the architecture review of 2026-11-08. Do the phases in order. Each phase ends with a commit.

## Phase 1: Theme module + split `hyprland.lua` (top priority)

`hyprland.lua` is the file that changes most (14 commits), and the Lua migration is recent, so now is the cheapest time to reshape it.

### 1a. Create the `theme` package
- [x] Create `theme/.config/theme/` as the only place palette and font values are defined.
- [x] Add `mocha.css` (GTK-CSS `@define-color`). Move it here from `waybar/.config/waybar/mocha.css`.
- [x] Add `mocha.lua` (returns a table of colours plus `font = "JetBrainsMono Nerd Font"`).
- [x] Move `hyprmocha/.config/hypr/mocha.conf` here for hyprlock, and delete the `hyprmocha` package.
- [x] waybar: change `style.css` to `@import "../theme/mocha.css";`.
- [x] wofi: delete the 52 inline `@define-color` lines, `@import` the shared `mocha.css`, and switch the font from CaskaydiaCove to JetBrains Mono.
- [x] kitty / gitui: keep their own formats, but note in the theme folder that they are adapters of the same palette.
- [x] Optional: if keeping these files in sync by hand gets annoying, write a small script that generates all of them from one `palette.toml`.
- [x] Check: `grep -rEn '#[0-9a-fA-F]{6}' --exclude-dir=theme --exclude-dir=.git .` should only find intentional colours.

### 1b. Split `hyprland.lua` into modules
- [x] `monitors.lua`: `lenovo` / `aoc` outputs, the fallback monitor, and the workspace 1–5 / 6–10 split.
- [x] `apps.lua`: `terminal`, `fileManager`, `menu`, the screenshot command. Binds read from these (they are currently hardcoded and the locals are never used).
- [x] `binds.lua`: generate the workspace focus/move binds with a `for i = 1, 10` loop, and the direction binds with a loop over `{left,right,up,down}`.
- [x] `look.lua`: general/decoration/animations. Border colours come from `theme/mocha.lua`, replacing the stock `rgba(33ccffee)`.
- [x] `hyprland.lua`: reduce it to a list of `require`s (env and input can stay here or get their own file).
- [x] Delete the ~130 lines of commented-out hyprlang (git history keeps them).
- [x] Check after each step: `hyprctl reload && hyprctl configerrors`.
- [x] Don't add per-host overrides until a second machine exists.

## Phase 2: Shell environment
- [x] Add `environment.d/.config/environment.d/10-session.conf` with `SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket` and PATH additions (`~/.cargo/bin`).
- [x] Track `~/.zshenv` in the `zshrc` package (keep only zsh-specific settings there).
- [ ] Remove the hardcoded `SSH_AUTH_SOCK` from `~/.claude/settings.json` once the environment.d file works.
- [x] Set `ZSH_CUSTOM=$HOME/.config/zsh/custom`. Move `dissoni.zsh-theme` there and delete the `oh-my-zsh` package (it currently writes into the oh-my-zsh git clone).
- [x] Move `HISTFILE` to `$XDG_STATE_HOME/zsh/history` (copy the existing history first!).
- [ ] Check: `systemctl --user show-environment | grep SSH_AUTH_SOCK`, then open a new terminal and run `echo $HISTFILE`.

## Phase 3: Bootstrap
- [x] Move `sddm/` to `system/sddm/` so `stow */` never links it into `$HOME`.
- [x] `.stowrc` / package list of the home packages to stow.
- [x] `packages.txt`: hyprland, hyprlock, hypridle, hyprpaper, hyprshot, waybar, wofi, kitty, thunar, eza, yazi, gitui, htop, zed, gh, stow, ttf-jetbrains-mono-nerd, catppuccin GTK theme, sddm-astronaut-theme, nwg-look…
- [x] `install.sh` (idempotent):
  1. install `packages.txt` (pacman/yay)
  2. clone oh-my-zsh if it's missing
  3. `stow` the home packages
  4. link `system/sddm/sddm.conf` → `/etc/sddm.conf` (sudo)
  5. `systemctl --user enable ssh-agent.socket orbit.service`
  6. recreate the gtk-4.0 links to `/usr/share/themes/catppuccin-mocha-red-standard+default`
- [x] `README.md`: what the repo is, and how to run `install.sh`.
- [x] Check: `stow -n -v <pkgs>` dry-run; optionally run the script in an `archlinux` container.

## Phase 4: Merge the hypr packages
- [x] Merge `hyprland/`, `hyprlock/`, `hyprpaper/` into a single `hypr/` package (with `hypridle.conf`). Then stow links the whole `~/.config/hypr` folder, and new files there end up in the repo.
- [x] Unstow the old packages, delete the real `~/.config/hypr` directory, then `stow hypr`.

## Phase 5: Add the remaining configs from `$HOME`
Secrets stay out: `gh/hosts.yml`, `opencode/cli.json`, `opencode/service.json`, SSH keys, `~/.claude.json`.

- [x] ~~`ssh/.ssh/config` (file only; `~/.ssh` stays mode 700).~~ declined by user (2026-11-08)
- [x] ~~`gh/.config/gh/config.yml` (+ `.gitignore` `hosts.yml`).~~ declined by user (2026-11-08)
- [x] ~~`gtk/`: `gtk-3.0/settings.ini`, `gtk-4.0/settings.ini`, `.gtkrc-2.0`, `xsettingsd/xsettingsd.conf`, `nwg-look/config`.~~ declined by user (2026-11-08)
- [x] ~~`opencode/`: `opencode.jsonc`, `skills/` (ignore `node_modules`, `package*.json`, credential JSONs).~~ declined by user (2026-11-08)
- [x] ~~`claude/`: `CLAUDE.md`, `settings.json`, `skills/`, stowed one file at a time (not the whole `~/.claude`).~~ declined by user (2026-11-08)
- [x] ~~`xdg/.config/mimeapps.list`.~~ declined by user (2026-11-08)
- [x] Add a `.gitignore` at the repo root.
- [x] Skip: mpv (empty), neofetch, pavucontrol.ini, QtProject.conf, dconf, spotify, pulse.

## Housekeeping
- [x] Commit the pending `git/.gitconfig` credential-helper change.
