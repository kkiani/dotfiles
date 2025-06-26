local wezterm = require("wezterm")
local key_bindings = require("keymaps")
local commands = require("commands")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 14.0
config.command_palette_font_size = 22.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.default_prog = { "/run/current-system/sw/bin/fish", "-l" }
config.keys = key_bindings
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Making sure that fish is in the PATH
config.set_environment_variables = {
	PATH = "/usr/local/bin/:" .. os.getenv("PATH"),
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

wezterm.on("augment-command-palette", function(_, _)
	return commands
end)

return config
