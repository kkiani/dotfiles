require('keymap')
require('plugins')
require('commands')

-- general settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.so = 999

vim.api.nvim_command('set nowrap')
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.updatetime = 100

-- setting up theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd.highlight('clear SignColumn')


if vim.fn.exists("g:vscode") ~= 0 then
    vim.keymap.set('n', 'gr', VSCodeNotify('editor.action.rename'))
else
    -- ordinary Neovim
end
