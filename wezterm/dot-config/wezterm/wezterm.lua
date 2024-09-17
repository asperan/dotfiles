local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "Chester"
config.font = wezterm.font 'Iosevka Term SS04' -- Menlo style

return config
