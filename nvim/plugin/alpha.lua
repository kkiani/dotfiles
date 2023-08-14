local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local function footer()
	local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
	local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. "   Plugins " .. plugins_count .. nvim_version_info
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}
dashboard.section.buttons.val = {
	dashboard.button("o", "    Open file using Telescope", ":Telescope find_files <CR>"),
	dashboard.button("e", " 󰪶   Open file explorer", ":Explore<CR>"),
	dashboard.button("n", "    New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "    Recently Files", ":Telescope oldfiles <CR>"),
	dashboard.button("u", "    Update Plugins", ":PackerUpdate <CR>"),
	-- dashboard.button("<leader> f t", "   Find Text", ":Telescope live_grep <CR>"),
	-- dashboard.button("<leader> i p", "   Add/Remove Plugins", ":e ~/.config/nvim/lua/core/plugins.lua<CR>"),
	-- dashboard.button("<leader> e v", "   Configuration", ":e ~/.config/nvim/lua/config.lua <CR>"),
	dashboard.button("q", "   Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Function"
dashboard.section.buttons.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
--vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)
