return {
	"olimorris/codecompanion.nvim",
	opts = {
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					show_result_in_chat = true, -- Show mcp tool results in chat
					make_vars = true, -- Convert resources to #variables
					make_slash_commands = true, -- Add prompts as /slash commands
					requires_approval = true,
				},
			},
		},
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
				name = "copilot",
				model = "claude-sonnet-4-20250514",
				keymaps = {
					send = {
						modes = { n = "<S-CR>", i = "<S-CR>" },
					},
				},
			},
			inline = {
				adapter = "copilot",
				model = "claude-3-sonnet-20240229",
			},
			cmd = {
				adapter = "copilot",
				model = "claude-3-sonnet-20240229",
			},
		},
		display = {
			chat = {
				show_header_separator = true,
				show_reference = true,
				show_token_count = true,
				start_in_insert_mode = true,
				window = {
					layout = "vertical",
					position = "right",
					relative = "editor",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
