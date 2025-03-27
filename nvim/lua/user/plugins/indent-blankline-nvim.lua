return {
	"lukas-reineke/indent-blankline.nvim",
	-- dependencies = { "ellisonleao/gruvbox.nvim" },
	config = function()
		require("ibl").setup({
			indent = {
				char = "▏",
			},
			scope = {
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
