local M = {}
local telescope = require('telescope')

telescope.setup ({
    defaults = {
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    },
    extensions = {
    },
})

M.find_files = function ()
    require('telescope.builtin').find_files {
        find_command = {'rg', '--files', '--iglob', '!.git', '--hidden'}
    }
end

return M
