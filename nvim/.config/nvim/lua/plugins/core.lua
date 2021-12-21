local lsp_status_ok, lsp_installer = pcall(require ,'nvim-lsp-installer')
if not lsp_status_ok then
    return
end

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = false
    }
}

local coq_status_ok, coq = pcall(require,'coq')
if not coq_status_ok then
    return
end

-- Third party modules for COQ
local coq_3q_ok_status, coq_3q = pcall(require,'coq_3p')
if not coq_3q_ok_status then
    return
end

local treesitter_status_ok, treesitter = pcall(require,'nvim-treesitter.configs')
if not treesitter_status_ok then
    return
end

local servers = {
    'sumneko_lua',
    'bashls',
    'vimls',
    'rust_analyzer',
    'zls',
    'ccls'
}

-- LSP CONFIGURATION
for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)

    if server_is_found then
        if not server:is_installed() then
            server:install()
        end
    end
end


lsp_installer.on_server_ready(function(server)
    local default_opts = {}

    local server_opts = {
        ['sumneko_lua'] = function()
            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            default_opts.settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = runtime_path,
                    },
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            }
        end
    }


    local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
    server:setup(coq.lsp_ensure_capabilities(server_options))
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

-- TREESITTER SETTINGS
treesitter.setup({
    ensure_installed = 'maintained',
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
})
