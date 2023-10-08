local Utils = require("utils")
local telescope = require("telescope.builtin")
local themes = require("telescope.themes")

-- Terminal
vim.api.nvim_create_user_command("Terminal", function()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:match("term") then
			vim.api.nvim_set_current_buf(buf)
			return
		end
	end

	vim.cmd(":term")
	vim.cmd("setlocal nonumber norelativenumber")
end, {})

-- Code Explore
vim.api.nvim_create_user_command("Diagnostics", "Trouble", {})

-- Keymaps
vim.api.nvim_create_user_command("Keymaps", "Telescope keymaps", {})

-- DAP
vim.api.nvim_create_user_command("DapStart", ":lua require('dap').continue()", {})
vim.api.nvim_create_user_command("DapOpenUI", ":lua require('dapui').open()", {})
vim.api.nvim_create_user_command("DapCloseUI", ":lua require('dapui').close()", {})

-- Git Commands
vim.api.nvim_create_user_command("GitStatus", function()
	telescope.git_status(themes.get_ivy({
		previewer = false,
		initial_mode = "normal",
		layout_config = {
			height = 10,
		},
	}))
end, {})
vim.api.nvim_create_user_command("GitAddAll", ":Git add .", {})
vim.api.nvim_create_user_command("GitAddBuffer", function()
	local current_file = vim.api.nvim_buf_get_name(0)
	return Utils.exec({ "Git", "add", current_file })
end, {})
vim.api.nvim_create_user_command("GitPush", ":Git push", {})
vim.api.nvim_create_user_command("GitPushForce", ":Git push --force", {})
vim.api.nvim_create_user_command("GitPull", ":Git pull", {})
vim.api.nvim_create_user_command("GitCommit", function()
	local result = os.execute("git diff --cached --quiet")
	if result == 0 then
		-- No changes to commit
		vim.api.nvim_command("Git add .")
	end

	vim.api.nvim_command("Git commit")
end, {})
vim.api.nvim_create_user_command("GitAmend", ":Git amend", {})
vim.api.nvim_create_user_command("GitAmendAll", function()
	vim.api.nvim_command("Git add .")
	vim.api.nvim_command("Git amend")
end, {})
vim.api.nvim_create_user_command("GitDiscard", ":Git discard", {})
vim.api.nvim_create_user_command("GitUncommit", ":Git uncommit", {})
vim.api.nvim_create_user_command("GitUnstage", ":Git unstage", {})
vim.api.nvim_create_user_command("GitStashPush", function()
	vim.api.nvim_command("Git add .")
	vim.api.nvim_command("Git stash push")
end, {})
vim.api.nvim_create_user_command("GitStashPop", function()
	telescope.git_stash(themes.get_ivy({
		previewer = false,
		initial_mode = "normal",
		layout_config = {
			height = 10,
		},
	}))
end, {})
vim.api.nvim_create_user_command("GitBranches", function()
	telescope.git_branches(themes.get_ivy({
		previewer = false,
		layout_config = {
			height = 10,
		},
	}))
end, {})
vim.api.nvim_create_user_command("GitCheckout", "GitBranches", {})
vim.api.nvim_create_user_command(
	"GitGraph",
	"tabe | Git  ++curwin log --graph --abbrev-commit --decorate --date=relative --all",
	{}
)
vim.api.nvim_create_user_command("GitDiff", ":Gvdiffsplit", {})

-- Window and split management
vim.api.nvim_create_user_command("DynamicSplit", function()
	local win_width = vim.fn.winwidth(0)
	local win_height = vim.fn.winheight(0) * 3
	local win_ratio = win_width / win_height

	if win_ratio > 1 then
		vim.api.nvim_command("vsplit")
	else
		vim.api.nvim_command("split")
	end
end, {})

-- LSP
vim.api.nvim_create_user_command("RenameSymbol", ":lua vim.lsp.buf.rename()", {})
vim.api.nvim_create_user_command("DocumentSymbol", ":Telescope lsp_document_symbols", {})

-- CDK
vim.api.nvim_create_user_command("CDKSynth", ":!cdk synth", {})
vim.api.nvim_create_user_command("CDKDeployAll", ":!cdk deploy --all", {})
vim.api.nvim_create_user_command("CDKDestroyAll", ":!cdk destroy --all", {})

-- Tests
vim.api.nvim_create_user_command("TestPytestAll", ":!pytest", {})
vim.api.nvim_create_user_command("TestPytestBuffer", ":!pytest %", {})
