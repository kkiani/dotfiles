return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		local function python_path()
			local virtual_env = vim.env.VIRTUAL_ENV
			if virtual_env then
				return virtual_env .. "/bin/python"
			else
				return vim.fn.exepath("python3")
			end
		end

		dap.configurations.python = {
			{
                justMyCode = false,
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
                justMyCode = false,
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = python_path(),
			},
		}

		dap.adapters.python = {
			type = "executable",
			command = python_path(),
			args = { "-m", "debugpy.adapter" },
		}
	end,
}
