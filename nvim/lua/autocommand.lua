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
