vim.opt.colorcolumn = "100"

-- Build Commands:
vim.api.nvim_create_user_command("Build", function()
	vim.cmd("wa")
	vim.cmd("term cargo build")
	vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("setlocal signcolumn=no")
end, { desc = "Build current rust project" })

vim.api.nvim_create_user_command("Run", function()
	vim.cmd("wa")
	vim.cmd("term cargo run")
	vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("setlocal signcolumn=no")
end, { desc = "Run current rust project" })
