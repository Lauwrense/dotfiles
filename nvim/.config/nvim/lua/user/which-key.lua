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
        r = {'<cmd>Lspsaga rename<cr>', 'Rename'},
        x = {'<cmd>Lspsaga code_action<cr>', 'Code Action'},
        o = {'<cmd>Lspsaga show_line_diagnostics<cr>', 'Line Diagnostics'},
        j = {'<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostics Next'},
        k = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostics Previous'},
        c = {
            name = 'Comments',
            c = {'Toggle current line using linewise comment'},
            b = {'Toggle current line using blockwise comment'},
            o = {'Insert comment to the next line'},
            O = {'Insert comment to the previous line'},
            A = {'Insert comment to the end of current line'}
        },

    },
    K = {'<cmd>Lspsaga hover_doc<cr>', 'Hover Docs'},
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
        x = {':<c-u>Lspsaga range_code_action<cr>', 'Code Action'},
        c = {'Toggle region using linewise comment'},
        b = {'Toggle region using blockwise comment'}
    }
}, {
    mode = 'x',
    silent = true,
    noremap = true,

})



