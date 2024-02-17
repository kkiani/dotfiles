vim.opt.colorcolumn = "120"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Terraform commands
vim.api.nvim_create_user_command("ValidateTerraform", function()
	vim.cmd("wa")
	vim.cmd("term! terraform init -backend=false; terraform validate")
	vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("setlocal signcolumn=no")
end, { desc = "Validate terraform codes" })

vim.api.nvim_create_user_command("PlanTerraform", function()
	vim.cmd("wa")
	vim.cmd("term! terraform init; terraform plan")
	vim.cmd("setlocal nonumber norelativenumber")
	vim.cmd("setlocal signcolumn=no")
end, { desc = "Validate terraform codes" })
