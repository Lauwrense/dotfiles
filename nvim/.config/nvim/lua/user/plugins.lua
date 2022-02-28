local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd("packadd packer.nvim")
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/user/bin/packer_compiled.lua",
})

packer.startup(function(use)
	-- Package Manager
	use({ "wbthomason/packer.nvim" })

	-- Colorscheme (user.colorscheme)
	use({ "EdenEast/nightfox.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })

	-- LSP (user.lsp)
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- COQ Autocomplete (user.coq)
	use({ "ms-jpq/coq_nvim", run = { ":COQdeps" } })
	use({ "ms-jpq/coq.thirdparty" })
	use({ "ms-jpq/coq.artifacts" })

	-- DAP (user.dap)
	use({ "mfussenegger/nvim-dap" })
	use({ "Pocco81/DAPInstall.nvim" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "simrat39/rust-tools.nvim" })

	-- treesitter (user.treesitter)
	use({ "nvim-treesitter/nvim-treesitter", run = { ":TSUpdate" } })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "lewis6991/spellsitter.nvim" })

	-- Telescope (user.telescope)
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-hop.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Git (user.gitsigns)
	use({ "lewis6991/gitsigns.nvim" })

	-- Specific
	use({ "nvim-neorg/neorg" }) -- (user.neorg)
	use({ "lervag/vimtex" }) -- (user.vimtex)

	-- Utils
	use({ "akinsho/nvim-toggleterm.lua" }) -- (user.toggleterm)
	use({ "windwp/nvim-autopairs" }) -- (user.autopairs)
	use({ "tami5/lspsaga.nvim" }) -- (user.lspsaga)
	use({ "folke/trouble.nvim" }) -- (user.trouble)
	use({ "folke/todo-comments.nvim" }) -- (user.todo-comments)
	use({ "norcalli/nvim-colorizer.lua" }) -- (user.colorizer)
	use({ "numToStr/Comment.nvim" }) -- (user.comment)
	use({ "blackCauldron7/surround.nvim" }) -- (user.surround)
	use({ "phaazon/hop.nvim" }) -- (user.hop)

	-- Preferences
	use({ "folke/which-key.nvim" }) -- (user.which-key)
	use({ "feline-nvim/feline.nvim" }) -- (user.statusline)
	use({ "nanozuki/tabby.nvim" }) -- (user.tabline)
	use({ "kyazdani42/nvim-tree.lua" }) -- (user.tree)
	use({ "lewis6991/impatient.nvim" }) -- (user.impatient)
	use({ "lukas-reineke/indent-blankline.nvim" }) -- (user.indent-blankline)
	use({ "beauwilliams/focus.nvim" }) -- (user.focus)
	use({ "max397574/better-escape.nvim" }) -- (user.better-escape)
	-- use({ "takac/vim-hardtime" })

	-- Dependancies
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })

	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
