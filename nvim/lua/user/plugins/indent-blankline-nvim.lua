return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = {
				highlight = "CursorLineSign",
				char = "▏",
			},
			scope = {
				highlight = "CursorLineFold",
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
	end,
}
