require("keymap")
require("plugins")
require("commands")
require("tasks")
require("autocommand")

-- general settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 2

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.so = 999

vim.api.nvim_command("set nowrap")
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.updatetime = 100

-- gitblame configs
vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_message_template = "<author> | <date>"

-- setting up theme
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_material_float_style = "bright"
vim.g.gruvbox_material_palette = "mix"
vim.cmd([[colorscheme gruvbox-material]])
vim.cmd.highlight("clear SignColumn")

if vim.fn.exists("g:vscode") ~= 0 then
	vim.keymap.set("n", "gr", VSCodeNotify("editor.action.rename"))
else
	-- ordinary Neovim
end

-- automate mode with terminal
vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Auto enter insert mode when opening a terminal",
	pattern = "*",
	callback = function()
		-- Wait briefly just in case we immediately switch out of the buffer
		vim.defer_fn(function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
				vim.cmd([[startinsert]])
			end
		end, 100)
	end,
})
