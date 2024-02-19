vim.opt.colorcolumn = "88"

-- Run and Test
vim.api.nvim_create_user_command("TestPytestAll", ":!pytest", {})
vim.api.nvim_create_user_command("TestPytestBuffer", ":!pytest %", {})
