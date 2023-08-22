vim.api.nvim_create_user_command("CommandRegister", function()
	vim.ui.input({ prompt = "Command to register: " }, function(register)
		vim.g.command_register = register
	end)
end, {})

vim.api.nvim_create_user_command("CommandRegisterRun", function()
	vim.cmd(vim.g.command_register)
end, {})
