return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,
			default_file_explorer = true,
			delete_to_trash = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
