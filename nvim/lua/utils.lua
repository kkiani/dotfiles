local function picker(opts, callback)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

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

local function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local function snacks_default_layout(opts)
    local wins = {}
    if opts and opts.show_preview == false then
        table.insert(wins, { win = "input", height = 1, border = "bottom" })
        table.insert(wins, { win = "list", border = "bottom", height = 0.3 })
    else
        table.insert(wins, { win = "preview", title = "{preview}", border = "none" })
        table.insert(wins, { win = "input", height = 1, border = "top_bottom" })
        table.insert(wins, { win = "list", border = "top_bottom", height = 0.3 })
    end

    local layout = {
        box = "vertical",
        backdrop = false,
        row = -1,
        width = 0,
        height = 0,
        border = "top",
        title = " {title} {live} {flags}",
        title_pos = "center",
    }
    vim.list_extend(layout, wins)

    return { layout = layout }
end

return {
    snacks_default_layout = snacks_default_layout,
	picker = picker,
	split_string = split_string,
	exec = exec,
	has_value = has_value,
}

-- example of using picker
-- picker({
--    title = "Choose a Color",
--    values = { "vim", "nvim" }
-- }, function(selection)
--     vim.api.nvim_put({ selection[1] }, "", false, true)
-- end)
--
