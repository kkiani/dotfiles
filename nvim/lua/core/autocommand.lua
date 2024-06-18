local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
	return vim.api.nvim_create_augroup("augroup" .. name, { clear = true })
end

autocmd("TextYankPost", {
	desc = "Highlight the yanked text for a specified time.",
	group = augroup("yank_highlight"),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 }) -- Keep the highlight for 250ms after yanking.
	end,
})

autocmd("FileType", {
	desc = "When opening Git commit messages, start the buffer in Insert mode",
	group = augroup("git_insert"),
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})

autocmd("FocusLost", {
	desc = "Save/write all unsaved buffers when focus is lost",
	group = augroup("save_buffers"),
	pattern = "*",
	command = "silent! wall",
})

autocmd("FileType", {
	desc = "Close some filtypes simply by pressing 'q'",
	group = augroup("close_with_q"),
	pattern = { "checkhealth", "help", "lspinfo", "man", "notify", "qf", "query" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

autocmd("BufNewFile", {
	desc = "Create a simple README.md file",
	group = augroup("readme_template"),
	pattern = "**/README.md",
	command = "0r ~/.config/nvim/skeletons/readme.md",
})

-- auto format on save
autocmd("BufWritePost", {
	desc = "Auto format on save",
	group = augroup("format_on_save"),
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "oil" then
			return
		end

		vim.cmd("FormatWrite")
	end,
})

-- automate mode with terminal
autocmd("TermOpen", {
	desc = "Auto enter insert mode when opening a terminal",
	pattern = "*",
	callback = function()
		-- Wait briefly just in case we immediately switch out of the buffer
		vim.defer_fn(function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
				vim.cmd([[startinsert]])
			end
		end, 100)
	end,
})

autocmd("VimResized", {
    desc = "Update the window dimensions",
    pattern = "*",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- netrw specific keybindings
autocmd("filetype", {
	desc = "netrw specific keybindings",
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "<esc>", ":bd<CR>", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", "h", "-", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", "l", "<CR>", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", ".", "gh", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", "<tab>", "mf", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", "<S-Tab>", "mF", { silent = true, buffer = true, remap = true })
		vim.keymap.set("n", "<leader><tab>", "mu", { silent = true, buffer = true, remap = true })
	end,
})
