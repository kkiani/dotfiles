local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 14.0
config.command_palette_font_size = 22.0
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
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
	{
		key = "o",
		mods = "CMD",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action_callback(function(win, pane)
            if pane:get_dimensions().pixel_width > pane:get_dimensions().pixel_height then
                pane:split { direction = 'Right' }
            else
                pane:split { direction = 'Top' }
            end
        end),
	},
	-- {
	-- 	key = "t",
	-- 	mods = "CMD",
	-- 	action = wezterm.action_callback(function(win, pane)
	-- 		win:perform_action({ SendKey = { mods = "CTRL", key = "t" } }, pane)
	-- 		win:perform_action({ SendKey = { key = "n" } }, pane)
	-- 	end),
	-- },
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
	return {
		{
			brief = "Rename tab",
			icon = "md_rename_box",

			action = wezterm.action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	}
end)

return config
