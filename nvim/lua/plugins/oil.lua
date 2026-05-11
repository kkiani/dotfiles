vim.pack.add({ { src = "https://github.com/stevearc/oil.nvim" } })

local has_value = require("utils").has_value

require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
		natural_order = true,
		is_always_hidden = function(name, _)
			return has_value({
				".git",
				".DS_Store",
				"..",
				".venv",
				".direnv",
				".devenv",
				".mypy_cache",
				".pytest_cache",
				".ruff_cache",
				"__pycache__",
			}, name)
		end,
	},
	columns = {
		"icon",
	},
})
