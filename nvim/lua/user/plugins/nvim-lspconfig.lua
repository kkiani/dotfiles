return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer" },
		})

		local lspconfig = require("lspconfig")

		-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
		lspconfig.lua_ls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.rust_analyzer.setup({})
		lspconfig.pyright.setup({})
		lspconfig.terraform_lsp.setup({})
	end,
}
