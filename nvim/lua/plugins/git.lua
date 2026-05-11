-- git-blame is already loaded eagerly in 01_ui.lua (needed by lualine)
vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
})

require("gitsigns").setup()
require("diffview").setup()
