vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("core.options")

if vim.fn.exists("g:vscode") ~= 0 then
    require("user.vscode")
	return
end

require("plugins")
require("core.keymap")
require("core.commands")
require("core.autocommand")
require("user.snippets.gitcommit")
require("lsp")
