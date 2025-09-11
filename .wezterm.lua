-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 200
config.initial_rows = 50

-- or, changing the font size and color scheme.
config.font = wezterm.font('Iosevka NF')
config.font_size = 12
config.color_scheme = 'Gruvbox Dark (Gogh)'

config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
}
config.max_fps = 100

-- Finally, return the configuration to wezterm:
return config