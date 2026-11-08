-- Monitors, XWayland scaling and workspace layout.
local lenovo = "desc:Lenovo Group Limited Y25-25 U4HCKD7Y"
local aoc    = "desc:AOC AG326UD 10PS6JA000020"

-- Left, vertically centered against the AOC's 1440 logical px height
hl.monitor({
  output   = lenovo,
  mode     = "1920x1080@239.96",
  position = "0x180",
  scale    = 1,
})

-- Right, 4K at 1.5 => 2560x1440 logical. VRR in fullscreen only, HDR off.
hl.monitor({
  output   = aoc,
  mode     = "3840x2160@165",
  position = "1920x0",
  scale    = 1.5,
  vrr      = 2,
})

-- Fallback for any other display
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

-- Render XWayland apps at native resolution instead of upscaling (sharp, not blurry)
hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})

-- Workspaces 1-5 on the AOC, 6-10 on the Lenovo
for i = 1, 10 do
  hl.workspace_rule({
    workspace  = tostring(i),
    monitor    = i <= 5 and aoc or lenovo,
    default    = (i == 1 or i == 6) or nil,
    persistent = true,
  })
end
