local Utils = require("utils")
local telescope = require("telescope.builtin")

-- Code Explore
vim.api.nvim_create_user_command("Diagnostics", "Trouble", {})

-- Keymaps
vim.api.nvim_create_user_command("Keymaps", "Telescope keymaps", {})

-- DAP
vim.api.nvim_create_user_command("DapStart", ":lua require('dap').continue()", {})
vim.api.nvim_create_user_command("DapOpenUI", ":lua require('dapui').open()", {})
vim.api.nvim_create_user_command("DapCloseUI", ":lua require('dapui').close()", {})

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
	telescope.git_branches({ previewer = false })
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
