-- Environment Variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment XDG_SESSION_ID XDG_RUNTIME_DIR WAYLAND_DISPLAY")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("$HOME/.config/hypr/startup.sh")
end)

-- Workspace / Monitor mapping
local main_display = "DP-2"
local extra_display = "DP-3"
hl.workspace_rule({ workspace = "1", monitor = main_display, default = true })
hl.workspace_rule({ workspace = "2", monitor = extra_display })
hl.workspace_rule({ workspace = "3", monitor = extra_display })
hl.workspace_rule({ workspace = "4", monitor = extra_display })
hl.workspace_rule({ workspace = "5", monitor = extra_display })
hl.workspace_rule({ workspace = "9", monitor = main_display })
hl.workspace_rule({ workspace = "10", monitor = main_display })

-- Config blocks
hl.config({
	xwayland = { force_zero_scaling = true },
	render = { direct_scanout = 2 },
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
	general = { layout = "dwindle" },
	dwindle = { preserve_split = true },
	decoration = {
		shadow = { enabled = false },
		blur = { enabled = false },
	},
})

-- Wrapper function to safely require modules without breaking the rest of the config
local function safe_require(module)
	local success, err = pcall(require, module)
	if not success then
		print("Failed to load module: " .. module .. "\nError: " .. tostring(err))
	end
end

-- Load generated DMS configurations
safe_require("dms.binds")
safe_require("dms.colors")
safe_require("dms.layout")
safe_require("dms.outputs")
safe_require("dms.windowrules")
safe_require("dms.cursor")

-- Load other lua configurations
safe_require("windowrules")
safe_require("devices")
safe_require("bindings")
safe_require("scrolling")
