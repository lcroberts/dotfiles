-- Modifiers
local mainMod = "SUPER"
local altMod = "ALT"

-- Mode bindings
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move window with vim keybinds
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Move workspace with vim keybinds
hl.bind(mainMod .. " + CTRL + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.workspace.move({ monitor = "r" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Group Keybinds
hl.bind(mainMod .. " + " .. altMod .. " + H", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + " .. altMod .. " + J", hl.dsp.window.move({ into_group = "d" }))
hl.bind(mainMod .. " + " .. altMod .. " + K", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + " .. altMod .. " + L", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + " .. altMod .. " + E", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + " .. altMod .. " + M", hl.dsp.group.toggle())
hl.bind(mainMod .. " + " .. altMod .. " + N", hl.dsp.group.next())

-- Useful binds
-- Application Launchers
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("flatpak run it.mijorus.smile"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd("systemctl suspend"))

-- Use pactl to adjust volume in PulseAudio.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- Add media controls
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

-- Keyboard backlight
hl.bind(mainMod .. " + " .. altMod .. " + up", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +33%"))
hl.bind(mainMod .. " + " .. altMod .. " + down", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 33%-"))

-- Reload Hyprland config
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))

-- Lock keybind
hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

-- Global mic mute (release bind)
hl.bind(altMod .. " + CTRL + M", hl.dsp.exec_cmd("dms ipc call audio micmute"), { release = true })

-- Screenshot (region, no file)
hl.bind(altMod .. " + SHIFT + S", hl.dsp.exec_cmd("dms screenshot region --no-file"))

-- Swap workspaces on monitors
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-2", monitor2 = "DP-3" }))
