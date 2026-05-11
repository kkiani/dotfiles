vim.pack.add({ { src = "https://github.com/mhartington/formatter.nvim" } })

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
		lua = { require("formatter.filetypes.lua").stylua },
		python = {
			require("formatter.filetypes.python").ruff,
			function()
				return {
					exe = "ruff",
					args = { "check", "--select", "I", "--fix", "-" },
					stdin = true,
				}
			end,
		},
		typescript = { prettier },
		javascript = { prettier },
		json = { prettier },
		yaml = { require("formatter.filetypes.yaml").prettier },
		terraform = { require("formatter.filetypes.terraform").terraformfmt },
		rust = { require("formatter.filetypes.rust").rustfmt },
		c = { require("formatter.filetypes.c").clangformat },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
