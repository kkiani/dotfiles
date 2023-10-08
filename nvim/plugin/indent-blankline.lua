-- https://github.com/lukas-reineke/indent-blankline.nvim

require("ibl").setup({
	indent = {
		highlight = "cursorLineSign",
		char = "▏",
	},
	scope = {
		highlight = "Grey",
		char = "▏",
		include = {
			node_type = {
				["*"] = {
					"*",
				},
			},
		},
	},
})
