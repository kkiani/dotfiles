vim.pack.add({ 
    { src = "https://github.com/folke/snacks.nvim" } 
})

require("snacks").setup({
    picker = { 
        enabled = true,
        ui_select = false,
        auto_close = true,
    },
})
