local wezterm = require("wezterm")

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
	{
		brief = "Open BTop at bottom",
		icon = "cod_dashboard",
		action = wezterm.action_callback(function(_, pane)
			pane:split({ direction = "Bottom", args = { "btop" } })
		end),
	},
	{
		brief = "Cheat Sheet",
		icon = "cod_book",
		action = wezterm.action_callback(function(_, pane)
			pane:window():spawn_tab({ args = { "fish", "-c", "csh" } })
		end),
	},
}
