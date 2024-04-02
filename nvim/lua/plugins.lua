-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Other packages
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "f-person/git-blame.nvim" })
	use({ "rbong/vim-flog" })
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
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
		},
	})
	use({ "petertriho/cmp-git" })
	use({ "mhartington/formatter.nvim" })
	use({ "mfussenegger/nvim-lint" })
	use({ "folke/trouble.nvim" })
	use({ "folke/todo-comments.nvim" })
	use({ "m4xshen/autoclose.nvim" })
	use({ "simrat39/rust-tools.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "github/copilot.vim", branch = "release" })
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "echasnovski/mini.nvim", branch = "stable" })
	use({ "stevearc/oil.nvim" })
	--use({ "ellisonleao/gruvbox.nvim" })
	use({ "nomnivore/ollama.nvim" })
	use({ "CopilotC-Nvim/CopilotChat.nvim" })
end)
