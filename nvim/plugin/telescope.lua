require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = 0.9,
				height = 0.9,
				preview_width = 0.6,
			},
			vertical = {
				width = 0.9,
				height = 0.9,
				preview_height = 0.7,
			},
			-- other layout configuration here
		},
		file_ignore_patterns = {
			"node_modules",
			".venv",
			".vscode",
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
