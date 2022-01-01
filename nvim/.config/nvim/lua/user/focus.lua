local focus = require('focus')

focus.setup({
    compatible_filetrees = {'nvimtree', 'nerdtree', 'chadtree', 'fern'},
    cursorline = false,
    signcolumn = true,
    cursorcolumn = false,
    colorcolumn = {
        enable = false,
        width = 100
    },
    number = false,
    relativenumber = false,
    hybridnumber = false,
})
