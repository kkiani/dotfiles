if vim.fn.exists("g:vscode") ~= 0 then
	vim.keymap.set("n", "gr", VSCodeNotify("editor.action.rename"))
end
