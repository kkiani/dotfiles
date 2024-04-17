return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "ellisonleao/gruvbox.nvim" },
	config = function()
		require("ibl").setup({
			indent = {
				highlight = "GruvboxBg1",
				char = "▏",
			},
			scope = {
				highlight = "GruvboxBg4",
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
