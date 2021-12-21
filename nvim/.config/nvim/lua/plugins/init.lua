local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.startup(function(use)
    -- Package Manager
    use {'wbthomason/packer.nvim'}

    -- LSP and Autocomplete (plugins.core)
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'ms-jpq/coq_nvim' }
    use { 'ms-jpq/coq.thirdparty' }
    use { 'ms-jpq/coq.artifacts' }
    use { 'nvim-treesitter/nvim-treesitter', run = {':TSUpdate'}}


    -- Theming (plugins.colorscheme)
    use { 'EdenEast/nightfox.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' } -- Statusline (plugins.statusline)


    -- Git (plugins.git)
    use { 'lewis6991/gitsigns.nvim' }

    -- Telescope (plugins.telescope)
    use { 'nvim-telescope/telescope.nvim' }


    -- Mappings (plugins.mappings)
    use { 'folke/which-key.nvim' }

    -- Misc (plugins.misc)
    use { 'andweeb/presence.nvim' }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'windwp/nvim-autopairs' }

    -- Dependancies
    use { 'nvim-lua/plenary.nvim' }


    if PACKER_BOOTSTRAP then
       packer.sync()
    end
end)



require('plugins.colorscheme')
require('plugins.telescope')
require('plugins.core')
require('plugins.mappings')
require('plugins.statusline')
require('plugins.misc')
require('plugins.autopairs')
