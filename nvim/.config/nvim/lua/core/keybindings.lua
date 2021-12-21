local status_ok, wk = pcall(require, "which-key")
if not status_ok  then
    return
end

vim.g.mapleader = ' '
-- NORMAL Mode
wk.register({
    -- File
    ['<leader>f'] = {'File'},
    ['<leader>ff'] = {'<cmd>lua require\'plugins.telescope\'.find_files()<cr>', 'Find Files'},
    ['<leader>fb'] = {'<cmd>Telescope file_browser<cr>', 'File Browser'},

    ['<leader>S'] = {'<cmd>w<cr>', 'Save'},

    ['('] = {'<cmd>bprevious<cr>', 'Previous buffer'},
    [')'] = {'<cmd>bnext<cr>', 'Next buffer'}
},{
    mode = 'n',
    silent = true,
    noremap = true
})


-- INSERT Mode
wk.register({
    -- COQ
    ['<expr>'] = {
        ['<esc>'] = {'pumvisible() ? "<c-e><esc>" : "<esc>"'},
        ['<c-c>'] = {'pumvisible() ? "<c-e><c-c>" : "<c-c>"'},
        ['<tab>'] = {'pumvisible() ? "<c-n>" : "<tab>"'},
        ['<s-tab>'] = {'pumvisible() ? "<c-p>" : "<bs>"'},
        ['<cr>'] = {'<cmd>lua require("MPairsUtils").CR()<CR>'},
        ['<bs>'] = {'<cmd>lua require("MPairsUtils").BS()<CR>'}
    }
},{
    mode = 'i',
    silent = true,
    noremap = true,
})
