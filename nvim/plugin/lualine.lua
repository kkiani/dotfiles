-- https://github.com/nvim-lualine/lualine.nvim

local git_blame = require("gitblame")

local function curret_buffer_path()
	return vim.fn.expand("%:.")
end

local function current_buffer_close()
	vim.cmd(":q")
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
		lualine_y = { "encoding", "fileformat", "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"tabs",
				mode = 1,
				fmt = function(name, context)
					-- Show + if buffer is modified in tab
					local buflist = vim.fn.tabpagebuflist(context.tabnr)
					local winnr = vim.fn.tabpagewinnr(context.tabnr)
					local bufnr = buflist[winnr]
					local mod = vim.fn.getbufvar(bufnr, "&mod")

					return name .. (mod == 1 and " [*]" or "")
				end,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { curret_buffer_path },
		lualine_z = {
			{
				"close",
				fmt = function()
					return "󰅖"
				end,
				on_click = current_buffer_close,
			},
		},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
