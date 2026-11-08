-- General look and feel: borders, decoration, animations, layouts.
local mocha = require("theme.mocha")

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 2,
    border_size = 3,
    -- Resize windows by clicking and dragging on borders and gaps
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
    col = {
      active_border = { colors = { "rgba(" .. mocha.lavender .. "ee)", "rgba(" .. mocha.mauve .. "ee)" }, angle = 45 },
      inactive_border = "rgba(" .. mocha.surface1 .. "aa)",
    },
  },
})

hl.config({
  decoration = {
    rounding = 3,
    rounding_power = 3,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 3,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
})

hl.config({
  animations = {
    enabled = false,
  },
})

hl.config({
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  misc = {
    force_default_wallpaper = 0,
    -- Disable the random hyprland logo / anime girl background
    disable_hyprland_logo = true,
  },
})
