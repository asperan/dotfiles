local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "Chester"
config.font = wezterm.font 'IosevkaTermSS04 Nerd Font' -- Menlo style

return config
