vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

require("nvim-treesitter").setup({
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    ensure_installed = {
        "python",
        "javascript",
        "typescript",
        "rust",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "bash",
        "terraform",
        "go",
    },
})
