local Utils = require("utils")

local tasks_directory = vim.fn.finddir(".vim/tasks", vim.fn.getcwd() .. ";")
local tasks = vim.split(vim.fn.glob(tasks_directory .. "/*.sh"), "\n", { trimempty = true })

vim.api.nvim_create_user_command("TasksRun", function()
	if next(tasks) ~= nil then
		Utils.picker({
			title = "Choose a bash script task to run",
			values = tasks,
		}, function(selection)
			Utils.exec({ ":term bash", selection[1] })
		end)
	else
		print("No tasks defined for this project")
	end
end, {})
