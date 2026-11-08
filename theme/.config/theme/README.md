# theme

Single place where the Catppuccin Mocha palette and the font are defined.

- `mocha.css`  GTK-CSS `@define-color`, imported by waybar and wofi.
- `mocha.lua`  table of colours (hex without `#`) plus `font`, required by the Hyprland Lua config.
- `mocha.conf` hyprlang variables, sourced by hyprlock.

`kitty/current-theme.conf` and `gitui/theme.ron` are adapters of the same palette in
their own formats; update them by hand when the palette changes.
