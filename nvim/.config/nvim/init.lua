local user_modules = {
    'user.plugins',
    'user.options',

    'user.colorscheme',
    'user.lsp',
    'user.coq',
    'user.treesitter',
    'user.telescope',
    'user.gitsigns',
    'user.dap',

    'user.autopairs',
    'user.toggleterm',
    'user.lspsaga',
    'user.trouble',
    'user.todo-comments',
    'user.comment',
    'user.colorizer',

    'user.which-key',
    'user.lualine',
    'user.project',
    'user.presence',
    'user.impatient',
    'user.indent-blankline',
    'user.focus',
    'user.better-escape',
}

print('null')

for _, module in pairs(user_modules) do
    local status_ok = pcall(require,module)
    if not status_ok then
        print('[M!] ' .. module)
    end
end

local compiled_status_ok, _ = require('user.bin.packer_compiled')
if not compiled_status_ok then
    return
end
