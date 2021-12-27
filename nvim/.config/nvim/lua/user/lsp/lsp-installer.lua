local lsp_installer = require('nvim-lsp-installer')

local servers = {
    'sumneko_lua',
    'bashls',
    'vimls',
    'rust_analyzer',
    'zls',
    'ccls'
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)

    if server_is_found then
        if not server:is_installed() then
            server:install()
        end
    end
end


lsp_installer.on_server_ready(function(server)
    local opts = {}

    if server.name == 'sumneko_lua' then
        local sumneko_lua = require('user.lsp.settings.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_lua, opts)
    end

    server:setup(coq.lsp_ensure_capabilities(opts))
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            uninstall_server = "X",
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    }
})


