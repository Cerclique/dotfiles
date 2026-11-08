-- Keybindings.
local apps = require("apps")

local mainMod = "SUPER"

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(apps.menu))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(apps.screenshot))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(apps.lock))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))

-- Move focus / move window with mainMod (+ SHIFT) + arrow keys
for _, dir in ipairs({ "left", "right", "up", "down" }) do
  hl.bind(mainMod .. " + " .. dir, hl.dsp.focus({ direction = dir }))
  hl.bind(mainMod .. " + SHIFT + " .. dir, hl.dsp.window.move({ direction = dir }))
end

-- Switch workspaces with mainMod + [1-0] (keycodes 10-19, layout independent);
-- move the active window with mainMod + SHIFT + [1-0]
for i = 1, 10 do
  local key = "code:" .. (9 + i)
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
