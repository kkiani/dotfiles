vim.pack.add({
    -- { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    -- { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

require("tree-sitter-manager").setup({
    highlight = true,
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
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         lookahead = true,
    --         keymaps = {
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = "@class.inner",
    --         },
    --     },
    -- },
})
