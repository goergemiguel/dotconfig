local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
config.use_fancy_tab_bar = false

-- Override key bindings to prevent creating new tabs
config.keys = {
	{ key = "t", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
