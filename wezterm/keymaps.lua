local wezterm = require("wezterm")

return {
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
		key = "o",
		mods = "CMD|SHIFT",
		action = wezterm.action.PaneSelect,
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action_callback(function(_, pane)
			if pane:get_dimensions().pixel_width > pane:get_dimensions().pixel_height then
				pane:split({ direction = "Right" })
			else
				pane:split({ direction = "Bottom" })
			end
		end),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
}
