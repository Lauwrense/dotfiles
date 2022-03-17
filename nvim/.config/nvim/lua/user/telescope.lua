local M = {}
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {"target", "build"},
		layout_config = {},
		mappings = {
			i = {
				["<C-h>"] = require("telescope").extensions.hop.hop,
			},
		},
	},
	extensions = {
		hop = {
			keys = {
				"asdfghjkl;qwertyuiopASDFGHJKL:QWERTYUIOP",
			},
			sign_hl = { "WarningMsg", "Title" },
			line_hl = { "CursorLine", "Normal" },
			clear_selection_hl = false,
			trace_entry = true,
			reset_selection = true,
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Load Telescope extensions
telescope.load_extension("hop")
telescope.load_extension("fzf")

-- Custom functions
M.find_files = function()
	builtin.find_files({
		layout_config = {
			preview_width = 0.6,
			preview_cutoff = 50,
		},
	})
end

return M
