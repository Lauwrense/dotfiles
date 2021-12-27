local user_modules = {
    'user.plugins',
    'user.options',

    'user.colorscheme',
    'user.lsp',
    'user.coq',
    'user.treesitter',
    'user.telescope',
    'user.gitsigns',

    'user.autopairs',
    'user.which-key',
    'user.lualine',
    'user.toggleterm',
    'user.nvim-tree',
    'user.lspsaga',
    'user.trouble',
    'user.todo-comments',
    'user.comment',
    'user.project',
    'user.presence',
    'user.colorizer',
    'user.focus'
}


for _, module in pairs(user_modules) do
    local status_ok = pcall(require,module)
    if not status_ok then
        print('[M!] ' .. module)
    end
end
