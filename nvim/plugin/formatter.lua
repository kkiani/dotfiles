-- Utilities for creating configurations
local util = require("formatter.util")

local function prettier()
	return {
		exe = "prettier",
		args = {
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = { require("formatter.filetypes.lua").stylua },
		python = { require("formatter.filetypes.python").black },
		typescript = { prettier },
		javascript = { prettier },
		json = { prettier },
		yaml = { prettier },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
