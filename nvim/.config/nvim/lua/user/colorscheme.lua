local nightfox = require("nightfox")

vim.cmd("colorscheme nordfox")

nightfox.setup({
	options = {
		transparent = false,
		terminal_colors = false,
		dim_inactive = true,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		inverse = {
			match_paren = false,
			visual = false,
			search = false,
		},
	},
})


require("nvim-web-devicons").setup({})
