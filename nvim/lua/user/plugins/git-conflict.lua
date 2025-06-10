return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = true,
			default_commands = true,
			disable_diagnostics = false,
			highlights = {
				incoming = "DiffAdd",
				current = "DiffChange",
			},
		})
	end,
}
