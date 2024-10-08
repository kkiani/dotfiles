local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local ls = require("luasnip")
local gitsigns = require("gitsigns")

-- dap remaps
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require('dapui').eval()<CR>", { desc = "Toggle Breakpoint" })

-- setting the leader key
vim.g.mapleader = " "

-- surroundings
vim.keymap.set("n", 'gs"', 'ciw""<esc>P', { noremap = true, silent = true, desc = "Surround word with double quotes" })
vim.keymap.set("n", "gs'", "ciw''<esc>P", { noremap = true, silent = true, desc = "Surround word with single quotes" })
vim.keymap.set(
	"v",
	'gs"',
	'c""<esc>P',
	{ noremap = true, silent = true, desc = "Surround selection with double quotes" }
)
vim.keymap.set(
	"v",
	"gs'",
	"c''<esc>P",
	{ noremap = true, silent = true, desc = "Surround selection with single quotes" }
)

-- markers
vim.keymap.set("n", "M", "m", { desc = "Set mark" })
vim.keymap.set("n", "m", "`", { desc = "Jump to mark" })

-- quickfix
vim.keymap.set("n", "<c-n>", ":cnext<CR>", { desc = "Go to next quickfix" })
vim.keymap.set("n", "<c-p>", ":cprev<CR>", { desc = "Go to previous quickfix" })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Go to next quickfix" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Go to previous quickfix" })

-- paste without yank
vim.keymap.set("x", "p", '"_dP', { noremap = true, desc = "Paste without yank" })

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- show command palette
vim.keymap.set("n", "<leader>p", function()
	builtin.commands(themes.get_ivy({
		prompt_title = "< Commands >",
		layout_config = {
			height = 10,
		},
	}))
end, { desc = "Show commands palette" })

-- help panel
vim.keymap.set("n", "?", ":Telescope help_tags<CR>", { desc = "Show help panel" })
vim.keymap.set("n", "<leader>?", ":Telescope keymaps<CR>", { desc = "Show keymaps panel" })

-- opening explorer
vim.keymap.set("n", "<leader><tab>", function()
	builtin.buffers(themes.get_ivy({
		prompt_title = "< Switch Buffer >",
		previewer = false,
		initial_mode = "normal",
		layout_config = {
			height = 10,
		},
		hidden = true,
	}))
end, { desc = "Open buffer explorer" })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true, desc = "Open explorer" })
vim.keymap.set("n", "<leader>o", function()
	builtin.find_files(themes.get_ivy({
		prompt_title = "< Open File >",
		previewer = false,
		layout_config = {
			height = 10,
		},
		hidden = true,
	}))
end, { desc = "Open file" })
vim.keymap.set("n", "<leader><leader>", ":b#<CR>", { silent = true, desc = "Jump to previous buffer" })

-- Find and Replace
vim.keymap.set("n", "<leader>f", ":Find<CR>", { desc = "Find string in project" })

-- git commands
vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gc", ":tab Git commit<CR>")
vim.keymap.set("n", "<leader>gg", ":GitStatus<CR>")
vim.keymap.set("n", "<leader>G", ":DiffviewOpen<CR>")
vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "ga", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("v", "ga", function()
	local first_line = vim.fn.line("v")
	local last_line = vim.fn.getpos(".")[2]
	gitsigns.stage_hunk({ first_line, last_line })
	-- go to normal mode after staging
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, true, true), "n", true)
end)

-- clipboard keymaps
vim.keymap.set("v", "gy", '"+y')
vim.keymap.set("v", "gp", '"+p')
vim.keymap.set("n", "gy", '"+y')
vim.keymap.set("n", "gY", '"+y$')
vim.keymap.set("n", "gp", '"+p')

-- GoTo code navigation
-- check the lsp-zero plugin files
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Show implementation" })
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition" })
vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Show references" })
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "Format code" })
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Show code actions" })
vim.keymap.set("n", "gj", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Show document symbols" })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic" })

-- window management
-- pane navigation
vim.keymap.set("n", "<leader>h", "<c-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<leader>j", "<c-w>j", { desc = "Move to bottom pane" })
vim.keymap.set("n", "<leader>k", "<c-w>k", { desc = "Move to top pane" })
vim.keymap.set("n", "<leader>l", "<c-w>l", { desc = "Move to right pane" })

vim.keymap.set("n", "<leader>H", "<c-w>H", { desc = "Move to left pane and expand" })
vim.keymap.set("n", "<leader>J", "<c-w>J", { desc = "Move to bottom pane and expand" })
vim.keymap.set("n", "<leader>K", "<c-w>K", { desc = "Move to top pane and expand" })
vim.keymap.set("n", "<leader>L", "<c-w>L", { desc = "Move to right pane and expand" })

vim.keymap.set("n", "<S-Tab>", "<cmd>tabNext<CR>", { silent = true, desc = "Switch to next tab" })
vim.keymap.set(
	"n",
	"<c-S>",
	"<cmd>DynamicSplit<CR>",
	{ desc = "Dynamically split window based on aspect ratio of current window" }
)

-- cancel out highlights on tapping Esc key
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "Cancel out highlights and go back to normal mode" })

-- quick exit
vim.keymap.set("n", "qq", ":q<CR>", { desc = "Quick exit" })
vim.keymap.set("n", "qt", ":tabclose<CR>", { desc = "Quick exit" })
vim.keymap.set("n", "Q", ":qa<CR>", { desc = "Quick exit all" })

-- go back and forward with buffers
vim.keymap.set("n", "[<leader>", "<c-o>", { desc = "Go back to previous buffer" })
vim.keymap.set("n", "]<leader>", "<c-i>", { desc = "Go forward to next buffer" })
vim.keymap.set("n", "[[", "<c-o>", { noremap = true, desc = "Go back to previous buffer" })
vim.keymap.set("n", "]]", "<c-i>", { noremap = true, desc = "Go forward to next buffer" })

-- recordings
vim.keymap.set("n", "<leader>q", "qq", { noremap = true, silent = false })
vim.keymap.set("n", ",", "@q", { noremap = true, silent = false })

-- netrw remaps
-- defined in autocommands.lua

-- dap remaps
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugger" })
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })

-- snippets remaps
vim.keymap.set({ "i", "s" }, "<c-n>", function()
	ls.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-b>", function()
	ls.jump(-1)
end, { silent = true })
