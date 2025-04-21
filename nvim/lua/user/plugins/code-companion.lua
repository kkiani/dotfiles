return {
	"olimorris/codecompanion.nvim",
	opts = {
		adapters = {
			llama3 = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "llama3",
					schema = {
						model = { default = "llama3:latest" },
						num_ctx = { default = 16384 },
						num_predict = { default = -1 },
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "copilot",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
