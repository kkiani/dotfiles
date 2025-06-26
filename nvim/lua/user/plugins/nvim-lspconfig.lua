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
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"pyright",
			},
		})

		local lspconfig = require("lspconfig")

		require("lspconfig.ui.windows").default_options.border = "single" -- setting border for floating windows

		lspconfig.sourcekit.setup({
			cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
			root_dir = function(filename, _)
				local util = require("lspconfig.util")

				return util.root_pattern("buildServer.json")(filename)
					or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
					or util.find_git_ancestor(filename)
					or util.root_pattern("Package.swift")(filename)
					or util.root_pattern("*.swift")(filename)
			end,
			capabilities = {
				require("cmp_nvim_lsp").default_capabilities(),
				textDocument = {
					completion = {
						completionItem = {
							snippetSupport = true,
						},
					},
				},
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
					didChangeConfiguration = {
						dynamicRegistration = true,
					},
					symbol = {
						dynamicRegistration = true,
					},
				},
			},
			settings = {
				sourcekit = {
					diagnostics = true,
				},
			},
		})
		lspconfig.lua_ls.setup({
			on_init = function(client)
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		-- setting borders for diagnostics, hover and signature help
		vim.diagnostic.config({ float = { border = "rounded" } })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	end,
}
