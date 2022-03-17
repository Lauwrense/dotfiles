local indent_blankline = require("indent_blankline")

indent_blankline.setup({
	show_trailing_blankline_indent = false,
	filetype_exclude = { "help", "norg", "packer", "terminal" },
})
