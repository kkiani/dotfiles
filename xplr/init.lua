version = "0.21.5"
local xplr = xplr
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

-- custom functions
xplr.fn.custom.open_in_default_app = function(app)
	local hovered_file = app.focused_node.absolute_path

	return {
		{ CallSilently0 = { command = "open", args = { hovered_file } } },
		{ LogSuccess = 'Opened "' .. hovered_file .. '" successfully.' },
	}
end

local favorites = function()
	return {
		{ "1", "Downloads", "/Users/kiarash/Downloads" },
		{ "2", "Desktop", "/Users/kiarash/Desktop" },
		{ "3", "Projects", "/Users/kiarash/projects" },
		{ "4", "Brenntag", "/Users/kiarash/projects/brenntag" },
		{ "5", "temp", "/tmp" },
		{ "6", "icloud", "/Users/kiarash/Library/Mobile Documents/com~apple~CloudDocs" },
		{ "7", "Home", "/Users/kiarash" },
	}
end

-- keybindings
xplr.config.modes.builtin.default.key_bindings.on_key.space = {
	help = "Open the file in the default application",
	messages = { { CallLua = "custom.open_in_default_app" } },
}

xplr.config.modes.builtin.default.key_bindings.on_key.tab = {
	help = "Toggle selection",
	messages = { "ToggleSelection" },
}

table.sort(favorites(), function(a, b)
	return a[1] < b[1]
end)
for i = 1, #favorites() do
	xplr.config.modes.builtin.default.key_bindings.on_key[tostring(i)] = {
		help = "Open favorite " .. favorites()[i][2],
		messages = {
			{ ChangeDirectory = favorites()[i][3] },
		},
	}
end

-- layout and style
xplr.config.general.panel_ui.default.border_style.fg = "Green"
xplr.config.general.panel_ui.default.title.style.fg = "Green"
xplr.config.general.panel_ui.default.border_type = "Thick"
xplr.config.layouts.builtin.default = {
	Horizontal = {
		config = {
			margin = 0,
			constraints = {
				{ Percentage = 70 },
				{ Percentage = 30 },
			},
		},
		splits = {
			{
				Vertical = {
					config = {
						margin = 0,
						constraints = {
							{ MaxLessThanScreenHeight = 1 },
							{ Length = 3 },
						},
					},
					splits = {
						"Table",
						"InputAndLogs",
					},
				},
			},
			{
				Vertical = {
					config = {
						margin = 0,
						constraints = {
							{ Percentage = 20 },
							{ Percentage = 20 },
							{ Percentage = 60 },
						},
					},
					splits = {
						{
							Static = {
								CustomTable = {
									ui = { title = { format = " Favorits " } },
									widths = {
										{ Percentage = 5 },
										{ Percentage = 25 },
										{ Percentage = 70 },
									},
									body = favorites(),
								},
							},
						},
						"Selection",
						"HelpMenu",
					},
				},
			},
		},
	},
}

-- plugins
package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"
os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))
require("xpm").setup({
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",
		"prncss-xyz/icons.xplr",
		{
			"dtomvan/extra-icons.xplr",
			after = function()
				xplr.config.general.table.row.cols[2] = { format = "custom.icons_dtomvan_col_1" }
			end,
		},
	},
	auto_install = true,
	auto_cleanup = true,
})
