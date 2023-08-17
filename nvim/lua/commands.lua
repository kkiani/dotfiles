local Utils = require("utils")
local telescope = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

-- Code Explore
vim.api.nvim_create_user_command("Diagnostics", function()
	telescope.diagnostics(telescope_themes.get_dropdown({ width = 0.5 }))
end, {})

-- Git Commands
vim.api.nvim_create_user_command("GitStatus", ":Git status", {})
vim.api.nvim_create_user_command("GitAddAll", ":Git add .", {})
vim.api.nvim_create_user_command("GitAddBuffer", function()
	local current_file = vim.api.nvim_buf_get_name(0)
	return Utils.exec({ "Git", "add", current_file })
end, {})
vim.api.nvim_create_user_command("GitPush", ":Git push", {})
vim.api.nvim_create_user_command("GitPushForce", ":Git push --force", {})
vim.api.nvim_create_user_command("GitPull", ":Git pull", {})
vim.api.nvim_create_user_command("GitCommit", ":tab Git commit", {})
vim.api.nvim_create_user_command("GitAmend", ":Git amend", {})
vim.api.nvim_create_user_command("GitDiscard", ":Git discard", {})
vim.api.nvim_create_user_command("GitUncommit", ":Git uncommit", {})
vim.api.nvim_create_user_command("GitUnstage", ":Git unstage", {})
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
vim.api.nvim_create_user_command(
	"GitGraph",
	"tab Git log --graph --abbrev-commit --decorate --date=relative --all | file GitGraph",
	{}
)

-- CDK
vim.api.nvim_create_user_command("CDKSynth", ":!cdk synth", {})
vim.api.nvim_create_user_command("CDKDeployAll", ":!cdk deploy --all", {})
vim.api.nvim_create_user_command("CDKDestroyAll", ":!cdk destroy --all", {})
