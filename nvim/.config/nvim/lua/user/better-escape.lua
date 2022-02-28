local better_escape = require("better_escape")

better_escape.setup({
	mapping = { "jj" },
	timeout = vim.o.timeoutlen,
	clear_empty_lines = false,
	keys = "<Esc>",
})
