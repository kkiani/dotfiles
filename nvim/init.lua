require("keymap")
require("plugins")
require("commands")
require("tasks")

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

vim.g.gitblame_display_virtual_text = 0

-- setting up theme
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_material_sign_column_background = nil
vim.cmd([[colorscheme gruvbox-material]])
vim.cmd.highlight("clear SignColumn")

if vim.fn.exists("g:vscode") ~= 0 then
	vim.keymap.set("n", "gr", VSCodeNotify("editor.action.rename"))
else
	-- ordinary Neovim
end

-- open explore if no file passed
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd(":silent! Telescope find_files")
		end
	end,
})
