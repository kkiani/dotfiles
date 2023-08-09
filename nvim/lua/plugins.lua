-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Other packages
	use({ "sainnhe/gruvbox-material" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	--use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "f-person/git-blame.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({ "mhartington/formatter.nvim" })
	use({ "mfussenegger/nvim-lint" })
	use({ "folke/trouble.nvim" })
	use({ "folke/todo-comments.nvim" })
	use({ "m4xshen/autoclose.nvim" })
	use({ "simrat39/rust-tools.nvim" })
	use({ "numToStr/Comment.nvim" })
end)
