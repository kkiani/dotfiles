local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- setting the leader key
vim.g.mapleader = " "

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- show command palette
vim.keymap.set("n", "<leader>r", ":TasksRun<CR>", { desc = "Show available task for current project" })
vim.keymap.set("n", "<leader>p", function()
	builtin.commands(themes.get_ivy({
		layout_config = {
			height = 10,
		},
	}))
end, { desc = "Show commands palette" })

-- help panel
vim.keymap.set("n", "?", ":Telescope help_tags<CR>", { desc = "Show help panel" })
vim.keymap.set("n", "<leader>?", ":Telescope keymaps<CR>", { desc = "Show keymaps panel" })

-- opening explorer
vim.keymap.set("n", "<leader>e", ":Explor<CR>", { desc = "Open explorer" })
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

-- find and replace
vim.keymap.set("n", "<leader>F", ":%s/", { desc = "Find and replace" })
vim.keymap.set("n", "<leader>f", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Find string in project" })

-- git commands
vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gc", ":tab Git commit<CR>")
vim.keymap.set("n", "<leader>gg", ":GitStatus<CR>")
vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "ga", ":Gitsigns stage_hunk<CR>")

-- clipboard keymaps
vim.keymap.set("v", "gy", '"+y')
vim.keymap.set("v", "gp", '"+p')
vim.keymap.set("n", "gy", '"+y')
vim.keymap.set("n", "gp", '"+p')

-- GoTo code navigation
-- check the lsp-zero plugin files
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Show implementation" })
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition" })
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Show references" })
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
vim.keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "Format code" })
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Show code actions" })
vim.keymap.set("n", "<leader>j", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Show document symbols" })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic" })

-- window management
vim.keymap.set("n", "<tab>", "<c-W>w", { desc = "Switch to next window" })
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
vim.keymap.set("n", "<leader><Esc>", ":only<CR>", { desc = "Keep current window only" })

-- go back and forward with buffers
vim.keymap.set("n", "[[", "<c-o>", { desc = "Go back to previous buffer" })
vim.keymap.set("n", "]]", "<c-i>", { desc = "Go forward to next buffer" })

-- re-run last command
vim.keymap.set({ "n", "v" }, ";", ":<up>", { noremap = true, silent = false, desc = "Re-select last command" })

-- recordings
vim.keymap.set("n", "<leader>q", "qq", { noremap = true, silent = false })
vim.keymap.set("n", ",", "@q", { noremap = true, silent = false })

-- netrw remaps
-- defined in autocommands.lua

-- dap remaps
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugger" })
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
