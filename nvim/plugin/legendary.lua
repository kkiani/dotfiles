local Utils = require("utils")
local telescope = require("telescope.builtin")
local telescope_themes = require("telescope.themes")

require("legendary").setup({
	keymaps = {},
	commands = {
		-- easily create user commands
		{
			"GitGraph",
			"tab Git log --graph --abbrev-commit",
			description = "Git graph using log",
		},
		{
			"GitBlame",
			":Git blame",
			description = "Open git blame panel",
		},
		{
			"GitCommit",
			":tab Git commit",
			description = "Commit staged changes",
		},
		{
			"GitAmend",
			":Git amend",
			description = "Append chenges to last commit",
		},
		{
			"GitUncommit",
			":Git uncommit",
			description = "Undo commit last commit",
		},
		{
			"GitUnstage",
			":Git unstage",
			description = "Unstage all the staged chenges",
		},
		{
			"GitAddAll",
			":Git add .",
			description = "Add all changes to stage",
		},
		{
			"GitDiscard",
			":Git discard",
			description = "Discard all staged and unstaged changes",
		},
		{
			"GitDiff",
			":Gvdiffsplit",
			description = "Open diff in split view",
		},
		{
			"GitStatus",
			":Git status",
			description = "Status of changes in current working directory",
		},
		{
			"GitAddCurrentBuffer",
			function()
				local current_file = vim.api.nvim_buf_get_name(0)
				return Utils.exec({ "Git", "add", current_file })
			end,
			description = "Add current buffer to staged changes",
		},
		{
			"GitPush",
			":Git push",
			description = "Push changes to origin remote",
		},
		{
			"GitPushForce",
			":Git push --force",
			description = "Force Push changes to origin remote",
		},
		{
			"GitPull",
			":Git pull",
			description = "Push changes from origin remote",
		},
		{
			"PackerSaveAndSync",
			function()
				vim.cmd(":w")
				vim.cmd(":so")
				vim.cmd(":PackerSync")
			end,
			description = "Save the current buffer and Sync via packer",
		},
		{
			"DiagnosticsCurrent",
			":Trouble document_diagnostics",
			description = "Diagnostics for current buffer/document/file",
		},
		{
			"DiagnosticsAll",
			":Trouble workspace_diagnostics",
			description = "Diagnostics for all files",
		},
		-- CDK
		{
			"CDKSynth",
			":!cdk synth",
			description = "Synthesize CloudFormation templates from CDK",
		},
		{
			"CDKDeployAll",
			":!cdk deploy --all",
			description = "Deploy all stacks",
		},
		{
			"CDKDestroyAll",
			":!cdk destroy --all",
			description = "Destroy all stacks",
		},
	},
	funcs = {},
	autocmds = {},
	-- load extensions
	extensions = {
		-- load keymaps and commands from nvim-tree.lua
		nvim_tree = true,
		-- load commands from smart-splits.nvim
		-- and create keymaps, see :h legendary-extensions-smart-splits.nvim
		smart_splits = {
			directions = { "h", "j", "k", "l" },
			mods = {
				move = "<C>",
				resize = "<M>",
			},
		},
		-- load commands from op.nvim
		op_nvim = true,
		-- load keymaps from diffview.nvim
		diffview = true,
	},
	select_prompt = " legendary.nvim ",
	-- Character to use to separate columns in the UI
	col_separator_char = "",
	default_item_formatter = nil,
	icons = {
		-- keymap items list the modes in which the keymap applies
		-- by default, you can show an icon instead by setting this to
		-- a non-nil icon
		keymap = nil,
		command = "-",
		fn = "󰡱",
		itemgroup = "",
	},
	include_builtin = true,
	include_legendary_cmds = true,
	sort = {
		-- sort most recently used item to the top
		most_recent_first = true,
		-- sort user-defined items before built-in items
		user_items_first = true,
		-- sort the specified item type before other item types,
		-- value must be one of: 'keymap', 'command', 'autocmd', 'group', nil
		item_type_bias = nil,
		-- settings for frecency sorting.
		-- https://en.wikipedia.org/wiki/Frecency
		-- Set `frecency = false` to disable.
		-- this feature requires sqlite.lua (https://github.com/kkharji/sqlite.lua)
		-- and will be automatically disabled if sqlite is not available.
		-- NOTE: THIS TAKES PRECEDENCE OVER OTHER SORT OPTIONS!
		frecency = {
			-- the directory to store the database in
			db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
			-- the maximum number of timestamps for a single item
			-- to store in the database
			max_timestamps = 10,
		},
	},
	lazy_nvim = {
		-- Automatically register keymaps that are defined on lazy.nvim plugin specs
		-- using the `keys = {}` property.
		auto_register = false,
	},
	which_key = {
		-- Automatically add which-key tables to legendary
		-- see ./doc/WHICH_KEY.md for more details
		auto_register = false,
		-- you can put which-key.nvim tables here,
		-- or alternatively have them auto-register,
		-- see ./doc/WHICH_KEY.md
		mappings = {},
		opts = {},
		-- controls whether legendary.nvim actually binds they keymaps,
		-- or if you want to let which-key.nvim handle the bindings.
		-- if not passed, true by default
		do_binding = true,
		-- controls whether to use legendary.nvim item groups
		-- matching your which-key.nvim groups; if false, all keymaps
		-- are added at toplevel instead of in a group.
		use_groups = true,
	},
	-- Which extensions to load; no extensions are loaded by default.
	-- Setting the plugin name to `false` disables loading the extension.
	-- Setting it to any other value will attempt to load the extension,
	-- and pass the value as an argument to the extension, which should
	-- be a single function. Extensions are modules under `legendary.extensions.*`
	-- which return a single function, which is responsible for loading and
	-- initializing the extension.
	extensions = {
		nvim_tree = false,
		smart_splits = false,
		op_nvim = false,
		diffview = false,
	},
})
