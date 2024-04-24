local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

-- Disable wayland b/c, it doesn't work on hyprland
if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
	config.enable_wayland = false
else
	config.enable_wayland = true
end

config.font = wezterm.font({
	family = "JetBrainsMono NFM",
})
config.font_size = 12

config.enable_tab_bar = false
config.window_background_opacity = 0.85

return config
