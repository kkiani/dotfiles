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
			phi = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "phi",
					schema = {
						model = { default = "phi4:14b" },
						num_ctx = { default = 16384 },
						num_predict = { default = -1 },
					},
				})
			end,
			qwen = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "qwen",
					schema = {
						model = { default = "qwen2.5:14b" },
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
