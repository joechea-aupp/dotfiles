local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.tab_max_width = 36
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9

config.window_padding = {
	left = 10,
	right = 0,
	top = 10,
	bottom = 0,
}

config.color_scheme = "GitHub Dark"
config.default_domain = "WSL:Ubuntu"
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 11
-- config.cell_width = 1
-- config.line_height = 1.1
return config
