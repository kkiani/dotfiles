local dap = require("dap")

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Pytest file",
		module = "pytest",
		args = { "${file}" },
		python = { "${env:VIRTUAL_ENV}/bin/python", "-Xfrozen_modules=off" },
		console = "integratedTerminal",
		cwd = "${workspaceFolder}",
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return vim.fn.getcwd() .. "/.venv/bin/python"
		end,
	},
}

dap.adapters.python = {
	type = "executable",
	command = ".venv/bin/python",
	args = { "-m", "debugpy.adapter" },
}
