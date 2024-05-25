local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config
