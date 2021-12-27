local wk = require('which-key')
vim.g.mapleader = ' '

local setup = {
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = false,
            suggestions = 10,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {},
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    window = {
        border = "double",
        position = "bottom",
        margin = { 2, 2, 2, 2 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
        n = {},
        i = {},
        v = {},
    },
}

wk.setup(setup)


-- NORMAL (SILENT, NOREMAP)
wk.register({
    ['<leader>'] = {
        f = {
            name = 'File',
            f = {'<cmd>lua require("user.telescope").find_files()<cr>', 'Find Files'},
        }
    },
    g = {
        c = {
            name = 'Comments',
            c = {'Toggle current line using linewise comment'},
            b = {'Toggle current line using blockwise comment'},
            o = {'Insert comment to the next line'},
            O = {'Insert comment to the previous line'},
            A = {'Insert comment to the end of current line'}
        },
        j = { '<cmd>lua require "gitsigns".next_hunk()<cr>', 'Next Hunk' },
        k = { '<cmd>lua require "gitsigns".prev_hunk()<cr>', 'Prev Hunk' },
        l = { '<cmd>lua require "gitsigns".blame_line()<cr>', 'Blame' },
        p = { '<cmd>lua require "gitsigns".preview_hunk()<cr>', 'Preview Hunk' },
        r = { '<cmd>lua require "gitsigns".reset_hunk()<cr>', 'Reset Hunk' },
        R = { '<cmd>lua require "gitsigns".reset_buffer()<cr>', 'Reset Buffer' },
        s = { '<cmd>lua require "gitsigns".stage_hunk()<cr>', 'Stage Hunk' },
        u = {
          '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>',
          'Undo Stage Hunk',
        },
        o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        C = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
        d = {
          '<cmd>Gitsigns diffthis HEAD<cr>',
          'Diff',
        },

    },
    l = {
        name = 'LSP',
        a = {'<cmd>Lspsaga code_action<cr>', 'Code Action'},
        i = {'<cmd>LspInfo<cr>', 'Info'},
        I = {'<cmd>LspInstallInfo<cr>', 'Installer Info'},
        j = {'<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostics Next'},
        k = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostics Previous'},
        q = {'<cmd>TroubleToggle<cr>', 'Trouble'},
        r = {'<cmd>Lspsaga rename<cr>', 'Rename'},
        o = {'<cmd>Lspsaga show_line_diagnostics<cr>', 'Line Diagnostics'},
        w = {'<cmd>Telescope lsp_workspace_diagnostics<cmd>', 'Workspace Diagnostics'},
    },
    K = {'<cmd>Lspsaga hover_doc<cr>', 'Hover Docs'},
    s = {
        name = 'Search',
        b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
        c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
        h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
        M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        R = { '<cmd>Telescope registers<cr>', 'Registers' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        C = { '<cmd>Telescope commands<cr>', 'Commands' },
    },
    t = {
        name = 'Terminal',
        f = {'<cmd>ToggleTerm direction=float<cr>', 'Float'},
    }
}, {
    mode = 'n',
    silent = true,
    noremap = true,
})


-- NORMAL (SILENT)
wk.register({
    ['<C-u>'] = {'<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>'},
    ['<C-d>'] = {'<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>'}
}, {
    mode ='n',
    noremap = false
})


-- VISUAL (SILENT, NOREMAP)
wk.register({
    g = {
        name = 'Comments',
        c = {'Toggle region using linewise comment'},
        b = {'Toggle region using blockwise comment'}
    },
    l = {
        x = {':<c-u>Lspsaga range_code_action<cr>', 'Code Action'},
    }
}, {
    mode = 'x',
    silent = true,
    noremap = true,

})



