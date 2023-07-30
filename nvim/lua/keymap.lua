local builtin = require('telescope.builtin')

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
vim.keymap.set("n", "<leader>g", function()
    builtin.git_status()
end)

-- clipboard keymaps
vim.keymap.set("v", "gy", "\"+y")
vim.keymap.set("v", "gp", "\"+p")
vim.keymap.set("n", "gy", "\"+y")
vim.keymap.set("n", "gp", "\"+p")

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)")
vim.keymap.set("n", "gr", "<Plug>(coc-references)")
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)")

-- cancel out highlights on tapping Esc key
vim.keymap.set("n", "<Esc>", ":noh<CR>")

vim.api.nvim_command(
    'inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"')
