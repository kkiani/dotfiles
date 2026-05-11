-- plenary must be listed before telescope
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
})

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
