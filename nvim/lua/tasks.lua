local Utils = require("utils")

local tasks_directory = vim.fn.finddir(".vim/tasks", vim.fn.getcwd() .. ";")
local tasks = vim.split(vim.fn.glob(tasks_directory .. "/*.sh"), "\n", { trimempty = true })

vim.api.nvim_create_user_command("TasksRun", function()
	if next(tasks) ~= nil then
		vim.ui.select(tasks, { prompt = " Choose a bash script task to run" }, function(item, idx)
			Utils.exec({ ":term bash", item })
		end)
	else
		print("No tasks defined for this project")
	end
end, {})
