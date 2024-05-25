local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

return config
