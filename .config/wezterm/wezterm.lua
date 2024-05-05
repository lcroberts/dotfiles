local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

config.color_scheme = "Catppuccin Mocha"
config.use_ime = false

config.font = wezterm.font({ family = "JetBrainsMono NFM" })
if os.getenv("HOSTNAME") == "notascam-mobile" then
	config.font_size = 14
else
	config.font_size = 12
end

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24
config.window_background_opacity = 0.85

-- TODO: URL Clicking doesnt work atm
config.disable_default_mouse_bindings = true

config.disable_default_key_bindings = true
config.keys = {
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },

	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
	{ key = "_", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },

	{ key = ")", mods = "CTRL", action = act.ResetFontSize },
	{ key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },

	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },

	{ key = "T", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "R", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "R", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = false }) },

	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window({
		args = { "tmux", "new", "-As", "main" },
	})
	window:spawn_tab({
		args = {
			"fish",
			"-c",
			"deventer",
		},
	})
	tab:activate()
end)

return config
