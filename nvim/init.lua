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

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.so = 999

vim.api.nvim_command("set nowrap")
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.updatetime = 100

-- netrw configs
vim.g.netrw_list_hide = [[.*\.pyc$,\.\~$,__pycache__/$,\.git/,\~$,.DS_Store,\.vscode/,.mypy_cache/,.pytest_cache/]]
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_cursor = 1

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
