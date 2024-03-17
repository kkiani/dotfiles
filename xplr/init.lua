version = "0.21.5"
local xplr = xplr
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

-- Define the function
xplr.fn.custom.ask_name_and_greet = function(app)
	local hovered_file = app.focused_node.absolute_path

	return {
		{ CallSilently0 = { command = "open", args = { hovered_file } } },
		{ LogSuccess = 'Opened "' .. hovered_file .. '" successfully.' },
	}
end

xplr.config.modes.builtin.default.key_bindings.on_key.space = {
	help = "Open the file in the default application",
	messages = {
		{ CallLua = "custom.ask_name_and_greet" },
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
