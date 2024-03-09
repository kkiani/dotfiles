local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 14.0
config.command_palette_font_size = 22.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.Multiple({
			wezterm.action.ClearScrollback("ScrollbackAndViewport"),
			wezterm.action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "p",
		mods = "CMD",
		action = wezterm.action.ActivateCommandPalette,
	},
}

return config
