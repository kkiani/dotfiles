return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				selection_strategy = "reset",
				layout_config = {
					horizontal = {
						width = { padding = 0 },
						height = { padding = 0 },
						preview_width = 0.6,
					},
					vertical = {
						width = { padding = 0 },
						height = { padding = 0 },
						preview_height = 0.7,
					},
					-- other layout configuration here
				},
				file_ignore_patterns = {
					"node_modules/",
					".venv/",
					".vscode/",
					".git/",
				},
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
						n = {
							["dd"] = "delete_buffer",
						},
					},
				},
			},
		})
	end,
}
