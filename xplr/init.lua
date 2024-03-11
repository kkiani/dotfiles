version = "0.21.5"
local xplr = xplr

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
