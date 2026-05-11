vim.pack.add({ { src = "https://github.com/ellisonleao/gruvbox.nvim" } })

require("gruvbox").setup({
	terminal_colors = true,
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,
	palette_overrides = {},
	overrides = {
		["TelescopeSelection"] = { bg = "#458588" },
		["StatusLine"] = { reverse = false },
		["StatusLineNC"] = { reverse = false },
	},
	dim_inactive = false,
	transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
