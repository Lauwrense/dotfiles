local opt = vim.opt

opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.guifont = "FiraCode Nerd Font:h17"

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

opt.list = true
opt.listchars = "tab:> ,trail:•,extends:›,precedes:‹"
opt.spell = false
vim.cmd([[autocmd VimEnter *.tex :set spell]])

opt.mouse = "a"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
vim.cmd([[autocmd BufEnter *.tex :set wrap]])
opt.splitright = true
opt.splitbelow = true

opt.autochdir = false
opt.hidden = true
opt.fileencoding = "utf-8"
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect", "preview", "noinsert" }

opt.pumheight = 10
opt.showtabline = 1
opt.updatetime = 300
opt.timeoutlen = 1000
