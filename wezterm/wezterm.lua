local wezterm = require("wezterm")
local config = {}

config.default_prog = { "/usr/bin/zsh" }
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12.0

return config
