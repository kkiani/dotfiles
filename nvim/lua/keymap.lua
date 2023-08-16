local builtin = require("telescope.builtin")

-- setting the leader key
vim.g.mapleader = " "

-- show command palette
vim.keymap.set("n", "<leader>t", ":TasksRun<CR>")
vim.keymap.set("n", "<leader>p", ":Legendary commands<CR>")

-- help panel
vim.keymap.set("n", "?", ":Telescope help_tags<CR>")

-- opening explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>o", ":Telescope find_files hidden=true<CR>")

-- find and replace
vim.keymap.set("n", "<leader>F", ":%s/")
vim.keymap.set("n", "<leader>f", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- git commands
vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gc", ":tab Git commit<CR>")
vim.keymap.set("n", "<leader>gg", function()
	builtin.git_status()
end)

-- clipboard keymaps
vim.keymap.set("v", "gy", '"+y')
vim.keymap.set("v", "gp", '"+p')
vim.keymap.set("n", "gy", '"+y')
vim.keymap.set("n", "gp", '"+p')

-- GoTo code navigation
-- check the lsp-zero plugin files
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {})
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {})
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {})
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {})
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {})
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {})
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", {})
vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", {})
vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
vim.keymap.set("n", "<leader>j", "<cmd>Telescope lsp_document_symbols<cr>", {})

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", {})
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {})
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", {})

-- switching windows
vim.keymap.set("n", "<tab>", "<c-W>w")

-- cancel out highlights on tapping Esc key
vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- quick exit
vim.keymap.set("n", "qq", ":q<CR>")
vim.keymap.set("n", "<leader><Esc>", ":only<CR>")

-- go back and forward with buffers
vim.keymap.set("n", "<leader>[", "<c-6>")
vim.keymap.set("n", "<leader>]", "<c-^>")

-- rerun last command
vim.keymap.set({ "n", "v" }, "<CR>", ":<up>", { noremap = true, silent = false })
