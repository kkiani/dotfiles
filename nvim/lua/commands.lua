local Utils = require("utils")
local telescope = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

-- Git Commands
vim.api.nvim_create_user_command("GitCheckout", function()
	local branches = vim.api.nvim_exec('!git branch -a --format "\\%(refname:short)"', true)
	local branch_list = Utils.split_string(branches, "\n")
	table.remove(branch_list, 1)

	Utils.picker({
		title = "Choose a branch to checkout",
		values = branch_list,
	}, function(selection)
		Utils.exec({ ":!git", "checkout", selection[1] })
	end)
end, {})

