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
		brief = "Btop",
		icon = "cod_dashboard",
		action = wezterm.action_callback(function(window, pane)
			local tab, _, _ = window:mux_window():spawn_tab({
				args = { "btop" },
			})
			tab:set_title("BTop")
		end),
	},
	{
		brief = "Docker",
		icon = "md_docker",
		action = wezterm.action_callback(function(window, pane)
			local tab, _, _ = window:mux_window():spawn_tab({
				args = { "lazydocker" },
			})
			tab:set_title("Docker")
		end),
	},
	{
		brief = "ClaudeCode",
		icon = "md_robot",
		action = wezterm.action_callback(function(window, pane)
			pane:split({
				direction = "Right",
				args = { "claude" },
			})
		end),
	},
}
