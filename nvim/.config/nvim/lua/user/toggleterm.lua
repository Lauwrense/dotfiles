local toggleterm = require('toggleterm')

-- TODO: Configure toggleterm
toggleterm.setup({
    size = 20,
    hide_numbers = true,
    shade_filetypes = {},
    shading_factor = 1,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = 'double',
        width = function ()
            return math.floor(vim.api.nvim_win_get_width(0) * 0.8)
        end,
        height = function ()
            return math.floor(vim.api.nvim_win_get_height(0) * 0.8)
        end,
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
})


function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    local buf_set_keymap = vim.api.nvim_buf_set_keymap

    buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Terminals right here
---@diagnostic disable-next-line: unused-local
local Terminal = require('toggleterm.terminal').Terminal

