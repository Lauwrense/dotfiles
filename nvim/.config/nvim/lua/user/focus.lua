local focus = require("focus")

focus.setup({
	compatible_filetrees = { "nvimtree", "nerdtree", "chadtree", "fern" },
    treewidth = 20,
	cursorline = false,
	signcolumn = true,
	cursorcolumn = false,
	colorcolumn = {
		enable = false,
		width = 100,
	},
	number = false,
	relativenumber = false,
	hybridnumber = false,
})
