local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 14.0
config.command_palette_font_size = 22.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	border_left_width = "1.0cell",
	border_right_width = "1.0cell",
	border_bottom_height = "0.5cell",
	border_top_height = "0.5cell",
	border_left_color = "gray",
	border_right_color = "gray",
	border_bottom_color = "gray",
	border_top_color = "gray",
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

local function recompute_padding(window)
	local window_dims = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	local x_reminder = math.fmod(window_dims.pixel_width, config.font_size * 3)
	local x_half_padding = math.floor(x_reminder / 2)
	local y_reminder = math.fmod(window_dims.pixel_height, config.font_size)
	local y_half_padding = math.floor(y_reminder / 2)
	local new_padding = {
		left = x_half_padding,
		right = x_half_padding,
		top = y_half_padding,
		bottom = y_half_padding,
	}

	overrides.window_padding = new_padding
	window:set_config_overrides(overrides)
end

wezterm.on("window-resized", function(window, _)
	recompute_padding(window)
end)

wezterm.on("window-config-reloaded", function(window)
	recompute_padding(window)
end)

return config
