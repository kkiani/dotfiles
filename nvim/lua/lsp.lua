vim.lsp.config("emmylua_ls", {
	cmd = { "emmylua_ls" },
	filetypes = { "lua" },
	root_markers = { ".emmyrc.json", ".luarc.json", ".git" },
})

vim.lsp.config("ty", {
    cmd = {"ty", "server"},
    filetype = {"python"},
    root_dir = vim.fs.root(0, {".git/", "pyproject.toml"}),
})
