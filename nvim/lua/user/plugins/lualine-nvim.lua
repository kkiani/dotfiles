local git_blame = require("gitblame")

local function close_current_buffer()
	vim.cmd(":q")
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "ellisonleao/gruvbox.nvim", "nvim-tree/nvim-web-devicons" },
	priority = 500,
	config = function()
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
						"tabs",
						mode = 1,
						fmt = function(name, context)
							-- local title = context.tabnr .. " | " .. name
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local winnr = vim.fn.tabpagewinnr(context.tabnr)
							local bufnr = buflist[winnr]

							local title = name

							if vim.bo[bufnr].modified then
								title = title .. " "
							elseif vim.bo[bufnr].filetype == "terminal" then
								title = title .. " "
							elseif vim.bo[bufnr].filetype == "help" then
								title = title .. " "
							elseif vim.bo[bufnr].readonly or vim.bo[bufnr].modifiable == false then
								title = title .. " "
							end

							return title
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					{
						"filename",
						file_status = false,
						path = 1,
					},
				},
				lualine_z = {
					{
						"close",
						separator = {},
						fmt = function()
							return "󰅖"
						end,
						on_click = close_current_buffer,
					},
				},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
