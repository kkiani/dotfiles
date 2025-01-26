require("core.options")

if vim.fn.exists("g:vscode") ~= 0 then
	return
end

require("lazy-nvim")
require("core.keymap")
require("core.commands")
require("core.autocommand")
require("user.vscode")
require("user.snippets.gitcommit")
