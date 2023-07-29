-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'morhetz/gruvbox' }
    -- use { 'vim-airline/vim-airline' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile' }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'tpope/vim-fugitive' }
    use { 'mhinz/vim-signify' }
    use { 'zivyangll/git-blame.vim' }
    use { 'nvim-tree/nvim-web-devicons' }
end)
