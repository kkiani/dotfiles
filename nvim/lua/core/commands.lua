local Utils = require("utils")
local telescope = require("telescope.builtin")
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")
local oil = require("oil")

-- General
vim.api.nvim_create_user_command("CopyFilePath", function()
	local file_path = vim.fn.expand("%:p")
	vim.fn.setreg("+", file_path)
	vim.api.nvim_echo({ { "Copied file path to clipboard: " .. file_path, "Normal" } }, false, {})
end, {
	desc = "Copy the current file's full path to clipboard",
})

vim.api.nvim_create_user_command("DeleteFile", function()
	vim.cmd(":!rm %")
	vim.cmd(":bd")
end, {
	desc = "Delete the current file",
})

vim.api.nvim_create_user_command("WriteWithoutAutocommand", function()
	vim.cmd(":noautocmd w %")
end, {
	desc = "Save the current file without triggering autocommands",
})

-- Find and Replace
vim.api.nvim_create_user_command("Find", function()
	local current_dir = oil.get_current_dir()

	telescope.live_grep({
		attach_mappings = function(_, map)
			map("i", "<S-CR>", function(prompt_bufnr)
				vim.fn.setqflist({})
				actions.add_to_qflist(prompt_bufnr)
				vim.cmd("copen")
			end)
			return true
		end,
		search_dirs = { current_dir },
	})
end, { desc = "Search for a keyword in workspace and populates the results into quickfix list" })

vim.api.nvim_create_user_command("Replace", function()
	if vim.g.keyword == nil then
		vim.cmd(":redraw")
		vim.api.nvim_echo({ { "Error: No keyword provided. Try to Find first.", "ErrorMsg" } }, false, {})
		return
	end

	local replace = vim.fn.input("Replace with > ")
	if replace == "" then
		vim.cmd(":redraw")
		vim.api.nvim_echo({ { "Error: No replacement provided", "ErrorMsg" } }, false, {})
		return
	end

	vim.cmd("cfdo %s/" .. vim.g.keyword .. "/" .. replace .. "/ge | update")
	vim.cmd("cclose")
	vim.g.keyword = nil
end, {})

-- Terminal
vim.api.nvim_create_user_command("Terminal", function()
	local buffers = vim.api.nvim_list_bufs()
	vim.g.before_term_buff = vim.api.nvim_get_current_buf()

	for _, buf in ipairs(buffers) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		if buf_name:match("term") then
			vim.api.nvim_set_current_buf(buf)
			return
		end
	end

	vim.cmd(":term")
	vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("setlocal signcolumn=no")
	vim.keymap.set("n", "<Esc>", function()
		vim.api.nvim_set_current_buf(vim.g.before_term_buff)
	end, { silent = true, buffer = vim.api.nvim_get_current_buf() })
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
		selection_strategy = "row",
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

	vim.api.nvim_command("tab Git commit")
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
	local stash_name = vim.fn.input("Stash message (Optional) > ")
	vim.api.nvim_command("Git add .")

	if stash_name == "" then
		vim.api.nvim_command("Git stash push")
	else
		vim.api.nvim_command('Git stash push -m "' .. stash_name .. '"')
	end
end, {})
vim.api.nvim_create_user_command("GitStashPop", function()
	telescope.git_stash({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = state.get_selected_entry(prompt_bufnr)

				if selection == nil then
					error("No stash selected")
				else
					actions.close(prompt_bufnr)
					vim.api.nvim_command("Git stash pop " .. selection.value)
				end
			end)
			map("n", "dd", function(prompt_bufnr)
				local selection = state.get_selected_entry(prompt_bufnr)

				if selection == nil then
					error("No stash selected")
				else
					actions.close(prompt_bufnr)
					vim.api.nvim_command("Git stash drop " .. selection.value)
				end
			end)
			return true
		end,
	})
end, {})
vim.api.nvim_create_user_command("GitSwitch", function()
	telescope.git_branches(themes.get_ivy({
		previewer = false,
		layout_config = {
			height = 10,
		},
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local selection = state.get_selected_entry(prompt_bufnr)

				if selection == nil then
					actions.git_create_branch(prompt_bufnr)
				else
					actions.git_switch_branch(prompt_bufnr)
				end
			end)
			return true
		end,
	}))
end, {})
vim.api.nvim_create_user_command("GitCheckout", ":GitSwitch", {})
vim.api.nvim_create_user_command("GitVersioningHistory", ":Telescope git_bcommits", {})
vim.api.nvim_create_user_command("GitBranches", "Telescope git_branches", {})
vim.api.nvim_create_user_command("GitGraph", function()
	require("gitgraph").draw({}, { all = true, max_count = 5000 })
end, { desc = "Open Git Graph" })
vim.api.nvim_create_user_command("GitBlame", ":Git blame", {})
vim.api.nvim_create_user_command("GitLog", function()
	vim.cmd("DiffviewFileHistory")
end, { desc = "Show Git log" })
vim.api.nvim_create_user_command("GitBufferLog", function()
	local current_file = vim.api.nvim_buf_get_name(0)
	vim.cmd("DiffviewFileHistory " .. current_file)
end, { desc = "Git show log for the current buffer" })
vim.api.nvim_create_user_command("GitDiff", ":DiffviewOpen", { desc = "Open Git Diff View" })
vim.api.nvim_create_user_command("GitDiffBranch", function()
	telescope.git_branches({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("DiffviewOpen " .. selection.value)
			end)
			return true
		end,
	})
end, {})
vim.api.nvim_create_user_command("GitDiscardHunk", ":Gitsigns reset_hunk", {})
vim.api.nvim_create_user_command("GitRebase", function()
	telescope.git_branches({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Git rebase " .. selection.value)
			end)
			return true
		end,
	})
end, { desc = "Start a Git rebase" })
vim.api.nvim_create_user_command("GitRebaseContinue", ":Git rebase --continue", { desc = "Continue a Git rebase" })
vim.api.nvim_create_user_command("GitRebaseAbort", ":Git rebase --abort", { desc = "Abort a Git rebase" })

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
