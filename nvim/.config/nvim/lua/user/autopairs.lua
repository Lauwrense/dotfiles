local npairs = require("nvim-autopairs")

npairs.setup({
	disabled_filetypes = { "TelescopePrompt" },
	disable_in_macro = false,
	disable_in_visualblock = false,
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
	enable_moveright = true,
	enable_afterquote = true,
	enable_check_bracket_line = true,
	check_ts = false,
	map_cr = false,
	map_bs = false,
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

_G.MPairsUtils = {}

MPairsUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end

MPairsUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
