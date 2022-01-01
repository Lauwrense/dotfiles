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

packer.init({
    display = {
        open_fn = function()
              return require('packer.util').float({ border = 'single'})
        end
    },
    compile_path = vim.fn.stdpath('config')..'/lua/user/bin/packer_compiled.lua'
})

packer.startup(function(use)
    -- Package Manager
    use {'wbthomason/packer.nvim'}


    -- Colorscheme (user.colorscheme)
    use { 'EdenEast/nightfox.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }

    -- LSP (user.lsp)
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer' }

    -- COQ Autocomplete (user.coq)
    use { 'ms-jpq/coq_nvim' }
    use { 'ms-jpq/coq.thirdparty' }
    use { 'ms-jpq/coq.artifacts' }


    -- treesitter (user.treesitter)
    use { 'nvim-treesitter/nvim-treesitter', run = {':tsupdate'}}


    -- Telescope (user.telescope)
    use { 'nvim-telescope/telescope.nvim' }


    -- Git (user.gitsigns)
    use { 'lewis6991/gitsigns.nvim' }


    -- DAP (user.dap)
    use { 'mfussenegger/nvim-dap' }
    use { 'Pocco81/DAPInstall.nvim' }
    use { 'simrat39/rust-tools.nvim' }


    -- Utils
    use { 'akinsho/nvim-toggleterm.lua' }            -- (user.toggleterm)
    use { 'windwp/nvim-autopairs' }                  -- (user.autopairs)
    use { 'tami5/lspsaga.nvim' }                     -- (user.lspsaga)
    use { 'folke/trouble.nvim' }                     -- (user.trouble)
    use { 'folke/todo-comments.nvim' }               -- (user.todo-comments)
    use { 'norcalli/nvim-colorizer.lua' }            -- (user.colorizer)
    use { 'numToStr/Comment.nvim' }                  -- (user.comment)



    -- Preferences
    use { 'folke/which-key.nvim' }                   -- (user.which-key)
    use { 'nvim-lualine/lualine.nvim' }              -- (user.lualine)
    use { 'ahmedkhalf/project.nvim' }                -- (user.project)
    use { 'andweeb/presence.nvim' }                  -- (user.presence)
    use { 'lewis6991/impatient.nvim' }               -- (user.impatient)
    use { 'lukas-reineke/indent-blankline.nvim' }    -- (user.indent-blankline)
    use { 'beauwilliams/focus.nvim' }                -- (user.focus)
    use { 'max397574/better-escape.nvim' }           -- (user.better-escape)

    -- Dependancies
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }


    if PACKER_BOOTSTRAP then
       packer.sync()
    end
end)

