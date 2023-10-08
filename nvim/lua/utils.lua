local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function picker(opts, callback)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = opts.title or "Pick Option",
			finder = finders.new_table({
				results = opts.values,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					callback(action_state.get_selected_entry())
				end)
				return true
			end,
		})
		:find()
end

local function split_string(str, delimiter)
	local results = {}
	for sub_string in str:gmatch("([^" .. delimiter .. "]+)") do
		table.insert(results, sub_string)
	end

	return results
end

local function exec(args)
	return vim.api.nvim_command(table.concat(args, " "))
end

return {
	picker = picker,
	split_string = split_string,
	exec = exec,
}

-- example of using picker
-- picker({
--    title = "Choose a Color",
--    values = { "vim", "nvim" }
-- }, function(selection)
--     vim.api.nvim_put({ selection[1] }, "", false, true)
-- end)
