return {
	"mhartington/formatter.nvim",
	lazy = false,
	config = function()
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

		require("formatter").setup({
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = { require("formatter.filetypes.lua").stylua },
				python = { require("formatter.filetypes.python").black },
				typescript = { prettier },
				javascript = { prettier },
				json = { prettier },
				yaml = { prettier },
				terraform = { require("formatter.filetypes.terraform").terraformfmt },
				rust = { require("formatter.filetypes.rust").rustfmt },

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
