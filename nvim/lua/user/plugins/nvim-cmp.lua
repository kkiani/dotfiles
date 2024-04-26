return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", option = { show_autosnippets = true } },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<esc>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
				["<C-space>"] = cmp.mapping.complete(),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
		})

		cmp.setup.cmdline(":", {
			mapping = {
				["<esc>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
				["<space>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		cmp.setup.cmdline({ "/" }, {
			mapping = {
				["<esc>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),
				["<space>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
				{ name = "luasnip", option = { show_autosnippets = true } },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
