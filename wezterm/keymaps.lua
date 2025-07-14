local wezterm = require("wezterm")

return {
	-- map CMD + backspece to do crtl+u
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action.Multiple({
			-- wezterm.action.ClearScrollback("ScrollbackAndViewport"),
			wezterm.action.SendKey({ key = "u", mods = "CTRL" }),
		}),
	},
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
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|TABS" }),
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
	{
		key = "s",
		mods = "CMD|SHIFT",
		action = wezterm.action_callback(function(_, pane)
			local tab = pane:tab()
			local panes = tab:panes_with_info()
			if #panes == 1 then
				if pane:get_dimensions().pixel_width > pane:get_dimensions().pixel_height then
					pane:split({ direction = "Right" })
				else
					pane:split({ direction = "Bottom" })
				end
			elseif not panes[1].is_zoomed then
				panes[1].pane:activate()
				tab:set_zoomed(true)
			elseif panes[1].is_zoomed then
				tab:set_zoomed(false)
				panes[2].pane:activate()
			end
		end),
	},
}
