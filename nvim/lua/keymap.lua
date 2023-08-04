local builtin = require("telescope.builtin")

-- setting the leader key
vim.g.mapleader = " "

-- show command palette
vim.keymap.set("n", "<leader>p", function()
	builtin.commands()
end)

-- opening explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>o", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>f", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- git commands
vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
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

-- switching windows
vim.keymap.set("n", "<tab>", "<c-W>w")

-- cancel out highlights on tapping Esc key
vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- quick exit
vim.keymap.set("n", "qq", ":q<CR>")

-- go back and forward with buffers
vim.keymap.set("n", "<leader>[", "<c-6>")
vim.keymap.set("n", "<leader>]", "<c-^>")
