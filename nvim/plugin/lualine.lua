-- https://github.com/nvim-lualine/lualine.nvim

local git_blame = require("gitblame")

local function get_curret_buffer_path()
	return vim.fn.expand("%:.")
end

local function close_current_buffer()
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
		globalstatus = true,
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
				"filename",
				path = 1,
				icon = { "󰈙", align = "left" },
				separator = {},
				symbols = {
					readonly = "",
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				"close",
				separator = {},
				fmt = function()
					return ""
				end,
				on_click = close_current_buffer,
			},
		},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
